package org.syndic.client.web.event.controller;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.syndic.client.web.command.EventCommand;

import fr.upond.syndic.repo.model.common.Building;
import fr.upond.syndic.repo.model.event.Event;
import fr.upond.syndic.service.IManager;

/**
 * 
 * @author LYES KHERBICHE
 *
 */
@Controller
public class EventController {
	
	private static final Log logger = LogFactory.getLog(EventController.class);

	@Autowired
	private IManager<Object> manager;
	
	public void setManager(IManager<Object> manager) {
		this.manager = manager;
	}
	
	@RequestMapping(value = "/getformaddevent", method = RequestMethod.GET)
	public String getFormAddUser(Map<String,Object> model) {
		logger.info("==== Get Form Event =====");
		model.put("eventCommand", new EventCommand());
		return "addEventPage";
	}
	
	@RequestMapping(value = "/addevent", method = RequestMethod.POST)
	public String addEvent(@ModelAttribute("eventCommand") EventCommand eventCommand) {
		logger.info("==== Insert Event =====");
		logger.info("******** "+eventCommand.getEventName());
		Event event = new Event(eventCommand.getEventName(),eventCommand.getTypeEvent(),eventCommand.getDateEvent(),eventCommand.getDescEvent(),null);
		this.manager.add(event);
		return "welcomePage";
	}
	
	@RequestMapping(value = "/listevent", method = RequestMethod.GET)
	public String listEvent(ModelMap model) {
		for (Object event : this.manager.get(new Event()) ) {
			logger.info("event (name) "+((Event)event).getEventName());
		}
		
		model.addAttribute("listevent",this.manager.get(new Event()));
		return "listEventPage";
	}
	
	@RequestMapping(value = "/eventbuilding", method = RequestMethod.GET)
	public String affectEvent (@RequestParam String eventId, ModelMap model) {
		Event event = new Event();
		event.setEventName(eventId);
		for (Object ev : this.manager.get(event) ) {
			model.addAttribute("event", ev);
		}
		model.addAttribute("listBuilding",this.manager.get(new Building()));
		return "affectEventPage";
	}

}

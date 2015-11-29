package fr.upond.syndic.repo.model.event;

public class Event {
	private String eventName;
	private String typeEvent;
	private String dateEvent;
	private String descEvent;
	
	public Event() {
		super();
	}

	public Event(String eventName, String typeEvent, String dateEvent, String descEvent) {
		super();
		this.eventName = eventName;
		this.typeEvent = typeEvent;
		this.dateEvent = dateEvent;
		this.descEvent = descEvent;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getTypeEvent() {
		return typeEvent;
	}

	public void setTypeEvent(String typeEvent) {
		this.typeEvent = typeEvent;
	}

	public String getDateEvent() {
		return dateEvent;
	}

	public void setDateEvent(String dateEvent) {
		this.dateEvent = dateEvent;
	}

	public String getDescEvent() {
		return descEvent;
	}

	public void setDescEvent(String descEvent) {
		this.descEvent = descEvent;
	}
	

}

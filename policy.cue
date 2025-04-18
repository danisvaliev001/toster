package toster

import (
	"strings"
	"time"
	"list"
)

_timeFormat: "15:04"

params: {
	pricePerHour: int | *4500
	currency:     string & strings.MaxRunes(1) | *"₽"

	_timeSlots?: {
		[string]: {
			start: string
			end:   string
		}
	}

	slots?: [...{
		start: time.Time
		end:   time.Time & >start
		durationMinutes: int & >0
	}] | *[
		for name, meeting in _timeSlots {
			start: time.Parse(_timeFormat, meeting.start)
			end:   time.Parse(_timeFormat, meeting.end)
			durationMinutes: int(time.Sub(end, start) / 60_000_000_000)
		}
	]

	// Calculate total minutes and hours
	_totalMinutes: list.Sum([for s in slots {s.durationMinutes}])
	totalHours: _totalMinutes / 60.0

	cost: pricePerHour * totalHours
}

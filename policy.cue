package toster

import (
	"strings"
	"list"
	"strconv"
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

	slots: [
		if _timeSlots != _|_ for name, meeting in _timeSlots {
			start: meeting.start
			end:   meeting.end

			// Parse start time
			_startParts: strings.Split(start, ":")
			_startHour:  strconv.Atoi(_startParts[0])
			_startMin:   strconv.Atoi(_startParts[1])
			_startTotalMin: _startHour * 60 + _startMin

			// Parse end time
			_endParts: strings.Split(end, ":")
			_endHour:  strconv.Atoi(_endParts[0])
			_endMin:   strconv.Atoi(_endParts[1])
			_endTotalMin: _endHour * 60 + _endMin

			// Calculate duration in minutes
			durationMinutes: _endTotalMin - _startTotalMin
		}
	]

	// Calculate total minutes and hours
	_totalMinutes: list.Sum([for s in slots {s.durationMinutes}])
	totalHours: _totalMinutes / 60.0

	cost: pricePerHour * totalHours
}

package toster

import (
	"time"
)

// define the time format once
_timeFormat: "15:04"

PeterWon: params & {
	pricePerHour: 5700
	duration: {
		hours: 1
	}
  _timeSlots: {
      meeting1: {
          start: "00:15"
          end:   "00:40"
      }
      meeting2: {
          start: "00:50"
          end:   "01:55"
      }
  }
  slots: [
      for name, meeting in _timeSlots {
          start: time.Parse(_timeFormat, meeting.start)
          end:   time.Parse(_timeFormat, meeting.end)
      }
  ]
}

OlgaVlasova: params & {
	pricePerHour: 57
	currency: "$"
	duration: {
		hours:   2
		minutes: 30
	}
}

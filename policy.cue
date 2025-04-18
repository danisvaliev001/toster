package toster

import (
	"strings"
	"time"
)

params: {
	pricePerHour: int | *4500
	currency:     string & strings.MaxRunes(1) | *"₽"
	duration: {
		hours:      int | *0
		minutes:    int & >=0 & <60 | *0
		totalHours: hours+(minutes/60) & float64
	}
	slots?: [...{
		start: time.Time
		end:   time.Time & >start
	}]

	cost: pricePerHour * duration.totalHours
}

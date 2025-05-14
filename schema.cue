package toster

import (
	"strings"
	"list"
	"math"
)

schema: {
	pricePerHour: int | *_defaultPricePerHour
	currency:     string & strings.MaxRunes(1) | *_defaultCurrency
	slots: [...{
		startTime:       string & =~"^([01]?[0-9]|2[0-3]):[0-5][0-9]$"
		durationMinutes: int & >0 | *0
	}]
	totalMinutes: list.Sum([for s in slots if s.durationMinutes > 0 {s.durationMinutes}])
	finalCost: math.Ceil(pricePerHour * (totalMinutes / 60))
}

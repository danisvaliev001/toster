package toster

_defaultPricePerHour: 4500
_defaultCurrency:     "₽"

PeterWon: schema & {
	slots: [{
		startTime: "21:15"
	}]
}
OlgaVlasova: schema & {
	pricePerHour: 50
	currency:     "€"
	slots: [{
			startTime:       "13:05"
			durationMinutes: 30
		}, {
			startTime:       "15:40"
			durationMinutes: 60 * 3
		}]
}

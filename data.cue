package toster

PeterWon: params & {
	pricePerHour: 6000
  _timeSlots: {
      meeting1: {
          start: "00:15"
          end:   "00:40"
      }
      meeting2: {
          start: "00:50"
          end:   "01:45"
      }
  }
}

OlgaVlasova: params & {
	pricePerHour: 57
	currency: "$"
  _timeSlots: {
      meeting1: {
          start: "16:15"
          end:   "16:45"
      }
      meeting2: {
          start: "16:55"
          end:   "17:55"
      }
  }
}

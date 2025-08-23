func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hourlyRate) * 8.0
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  let daily = dailyRateFrom(hourlyRate: hourlyRate)
  let monthly = daily * 22.0
  let discounted = monthly * (1 - discount / 100.0)
  return discounted.rounded(.down)
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  let daily = dailyRateFrom(hourlyRate: hourlyRate)
  let discountedDaily = daily * (1 - discount / 100.0)
  return (budget / discountedDaily).rounded(.down)
}
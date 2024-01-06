def can_complete_circuit(gas, cost)
  stations = gas.length
  start_station = 0
  total_gas = 0
  current_gas = 0

  for i in 0..stations-1
    total_gas += gas[i] - cost[i]
    current_gas += gas[i] - cost[i]

    # If current_gas becomes negative, start from the next station
    if current_gas < 0
      current_gas = 0
      start_station = i + 1
    end
  end

  # If total_gas is non-negative, it means you can complete the circuit
  if total_gas >= 0
    return start_station
  else
    return -1
  end
end

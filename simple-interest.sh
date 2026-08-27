#!/bin/bash

# Simple Interest Calculator Script
# This script calculates simple interest based on user input

echo "========================================="
echo "   Simple Interest Calculator"
echo "========================================="
echo ""

# Prompt user for principal amount
echo -n "Enter the principal amount (P): "
read principal

# Prompt user for rate of interest
echo -n "Enter the annual interest rate (R in %): "
read rate

# Prompt user for time period
echo -n "Enter the time period (T in years): "
read time

# Check if inputs are valid numbers
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo ""
    echo "❌ Error: Please enter valid numeric values."
    echo "   Principal, Rate, and Time must be numbers."
    exit 1
fi

# Check if inputs are non-negative
if (( $(echo "$principal < 0" | bc -l) )) || (( $(echo "$rate < 0" | bc -l) )) || (( $(echo "$time < 0" | bc -l) )); then
    echo ""
    echo "❌ Error: Principal, Rate, and Time must be positive values."
    exit 1
fi

# Calculate simple interest using formula: SI = (P * R * T) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc -l)

# Calculate total amount: A = P + SI
total=$(echo "scale=2; $principal + $interest" | bc -l)

# Display results
echo ""
echo "========================================="
echo "   Calculation Results"
echo "========================================="
echo "Principal Amount:     $principal"
echo "Annual Interest Rate: $rate%"
echo "Time Period:          $time years"
echo "-----------------------------------------"
echo "Simple Interest:      $interest"
echo "Total Amount:         $total"
echo "========================================="

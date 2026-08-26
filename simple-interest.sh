#!/bin/bash

# Simple Interest Calculator

echo "-----------------------------------"
echo "    Simple Interest Calculator     "
echo "-----------------------------------"

# Prompt user for inputs
read -p "Enter Principal Amount (P): " principal
read -p "Enter Annual Interest Rate in % (R): " rate
read -p "Enter Time Period in years (T): " time

# Calculate Simple Interest using 'bc' for floating-point calculation
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total=$(echo "scale=2; $principal + $interest" | bc)

echo "-----------------------------------"
echo "Simple Interest (SI): $interest"
echo "Total Amount Payable: $total"
echo "-----------------------------------"

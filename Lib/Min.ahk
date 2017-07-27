min(num*){
	min := 9223372036854775807
	Loop % num.MaxIndex()
		min := (num[A_Index] < min) ? num[A_Index] : min
	return min
}

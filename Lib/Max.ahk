max(num*){
	max := -9223372036854775807
	Loop % num.MaxIndex()
		max := (num[A_Index] > max) ? num[A_Index] : max
	return max
}

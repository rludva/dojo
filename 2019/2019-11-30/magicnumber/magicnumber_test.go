package magicnumber

import "testing"

func TestGetMagicNumber(t *testing.T) {
	type testCase = struct {
		magicNumber int
		isMagic     bool
	}

	testCases := []testCase{
		{0, false},
		{13, true},
	}

	noMagicNumber := true

	for _, tt := range testCases {
		if got := GetMagicNumber(); tt.isMagic && got == tt.magicNumber {
			noMagicNumber = false
			break
		}
	}
	if noMagicNumber {
		t.Errorf("GetMagicNumber() should return a magic number..")
	}
}

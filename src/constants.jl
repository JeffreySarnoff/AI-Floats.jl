const InvalidBitwidth::Int16   = 1 
const SmallBitwidthMin::Int16  = 2
const SmallBitwidthMax::Int16  = 8
const MediumBitwidthMin::Int16 = SmallBitwidthMax + 1
const MediumBitwidthMax::Int16 = 16
const LargeBitwidthMin::Int16  = MediumBitwidthMax + 1
const LargeBitwidthMax::Int16  = 32
const HugeBitwidth::Int16 = LargeBitwidthMax + 1

is_bitwdith_valid(bitwidth::Int16) = HugeBitwidth > bitwidth > InvalidBitwidth
is_bitwdith_small(bitwidth::Int16) = InvalidBitwidth < bitwdith < MediumBitwidthMin
is_bitwdith_medium(bitwidth::Int16) = SmallBitwidthMax < bitwidth < LargeBitwidthMin
is_bitwdith_large(bitwidth::Int16)  = MediumBitwidthMax < bitwidth < HugeBitwidth

is_bitwdith_valid(bitwidth::Integer) = HugeBitwidth > bitwidth > InvalidBitwidth
is_bitwdith_small(bitwidth::Integer) = InvalidBitwidth < bitwdith < MediumBitwidthMin
is_bitwdith_medium(bitwidth::Integer) = SmallBitwidthMax < bitwidth < LargeBitwidthMin
is_bitwdith_large(bitwidth::Integer)  = MediumBitwidthMax < bitwidth < HugeBitwidth

const UNSIGNED = 0b0000_0100
const SIGNED   = 0b0000_1000
const FINITE   = 0b0000_0001
const EXTENDED = 0b0000_0010

const SIGNEDNESS = SIGNED | UNSIGNED
const DOMAIN     = FINITE | EXTENDED
const FAMILY     = SIGNEDNESS | DOMAIN

const UNSIGNED_FINITE   = UNSIGNED | FINITE
const UNSIGNED_EXTENDED = UNSIGNED | EXTENDED
const SIGNED_FINITE     = SIGNED   | FINITE
const SIGNED_EXTENDED   = SIGNED   | EXTENDED 

is_unsigned_finite(x::UInt8)   = x === UNSIGNED_FINITE
is_unsigned_extended(x::UInt8) = x === UNSIGNED_EXTENDED
is_signed_finite(x::UInt8)     = x === SIGNED_FINITE
is_signed_extended(x::UInt8)   = x === SIGNED_EXTENDED

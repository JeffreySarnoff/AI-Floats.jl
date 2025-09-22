abstract type AbstractAIFloat{K, P} <: AbstractFloat end
abstract type AbstractUnsignedFloat{K, P} <: AbstractAIFloat{K, P} end
abstract type AbstractSignedFloat{K, P} <: AbstractAIFloat{K, P} end

is_unsigned(@nospecialize(T::Type{AbstractUnsignedFloat})) = true
is_unsigned(@nospecialize(T::Type{AbstractSignedFloat}))   = false
is_signed(@nospecialize(T::Type{AbstractUnsignedFloat}))   = false
is_signed(@nospecialize(T::Type{AbstractSignedFloat}))     = true

abstract type AkoUnsignedFiniteFloat{K, P}   <: AbstractUnsignedFloat{K, P} end
abstract type AkoUnsignedExtendedFloat{K, P} <: AbstractUnsignedFloat{K, P} end

abstract type AkoSignedFiniteFloat{K, P}   <: AbstractSignedFloat{K, P} end
abstract type AkoSignedExtendedFloat{K, P} <: AbstractSignedFloat{K, P} end

const AbstractUnsignedFloats = Union{AkoUnsignedFiniteFloat, AkoUnsignedExtendedFloat}
const AbstractSignedFloats   = Union{AkoSignedFiniteFloat, AkoSignedExtendedFloat}
const AbstractFiniteFloats   = Union{AkoUnsignedFiniteFloat, AkoSignedFiniteFloat}
const AbstractExtendedFloats = Union{AkoUnsignedExtendedFloat, AkoSignedExtendedFloat}

const AbstractUnsignedFloat{K,P} = Union{AkoUnsignedFiniteFloat{K,P}, AkoUnsignedExtendedFloat{K,P}}
const AbstractSignedFloat{K,P}   = Union{AkoSignedFiniteFloat{K,P}, AkoSignedExtendedFloat{K,P}}
const AbstractFiniteFloat{K,P}   = Union{AkoUnsignedFiniteFloat{K,P}, AkoSignedFiniteFloat{K,P}}
const AbstractExtendedFloat{K,P} = Union{AkoUnsignedExtendedFloat{K,P}, AkoSignedExtendedFloat{K,P}}

is_unsigned(@nospecialize(T::Type{AkoUnsignedFiniteFloat}))   = true
is_unsigned(@nospecialize(T::Type{AkoUnsignedExtendedFloat})) = true
is_unsigned(@nospecialize(T::Type{AkoSignedFiniteFloat}))     = false
is_unsigned(@nospecialize(T::Type{AkoSignedExtendedFloat}))   = false

is_signed(@nospecialize(T::Type{AkoUnsignedFiniteFloat}))     = false
is_signed(@nospecialize(T::Type{AkoUnsignedExtendedFloat}))   = false
is_signed(@nospecialize(T::Type{AkoSignedFiniteFloat}))       = true
is_signed(@nospecialize(T::Type{AkoSignedExtendedFloat}))     = true

is_finite(@nospecialize(T::Type{AkoUnsignedFiniteFloat}))     = true
is_finite(@nospecialize(T::Type{AkoUnsignedExtendedFloat}))   = false
is_finite(@nospecialize(T::Type{AkoSignedFiniteFloat}))       = true
is_finite(@nospecialize(T::Type{AkoSignedExtendedFloat}))     = false

is_extended(@nospecialize(T::Type{AkoUnsignedFiniteFloat}))   = false
is_extended(@nospecialize(T::Type{AkoUnsignedExtendedFloat})) = true
is_extended(@nospecialize(T::Type{AkoSignedFiniteFloat}))     = false
is_extended(@nospecialize(T::Type{AkoSignedExtendedFloat}))   = true

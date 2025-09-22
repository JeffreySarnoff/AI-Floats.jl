struct UnsignedFiniteFloat{K, P} <: AkoUnsignedFiniteFloat{K, P}
    bias::Int16
end

struct UnsignedExtendedFloat{K, P} <: AkoUnsignedExtendedFloat{K, P}
    bias::Int16
end

struct SignedFiniteFloat{K, P} <: AkoSignedFiniteFloat{K, P}
    bias::Int16
end

struct SignedExtendedFloat{K, P} <: AkoSignedExtendedFloat{K, P}
    bias::Int16
end

for S in (:UnsignedFiniteFloat, :UnsignedExtendedFloat, :SignedFiniteFloat, :SignedExtendedFloat)
    @eval begin
        bitwidth(x::$S{K, P}) where {K,P} = K
        precision(x::$S{K, P}) where {K,P} = P
        bias(x::$S) = x.bias

        Base.show(io::IO, ::MIME"text/plain", ::Type{$S}) = print(io, "$(string($S))")
        Base.show(io::IO, ::Type{$S}) = print(io, "$(string($S))")
        Base.:==(x::$S{K1,P1}, y::$S{K2,P2}) where {K1,K2,P1,P2} = (K1 == K2) && (P1 == P2)
        Base.:>(x::$S{K1,P1}, y::$S{K2,P2}) where {K1,K2,P1,P2} = (K1 > K2) && (P1 >= P2)
        Base.:<=(x::$S{K1,P1}, y::$S{K2,P2}) where {K1,K2,P1,P2} = (K1 < K2) || ((K1 == K2) && (P1 <= P2))
        Base.hash(x::$S{K,P}, h::UInt) where {K,P} = hash(K, hash(P, h))
    end
end

is_unsigned(@nospecialize(x::UnsignedFiniteFloat))   = true
is_unsigned(@nospecialize(x::UnsignedExtendedFloat)) = true
is_unsigned(@nospecialize(x::SignedFiniteFloat))     = false
is_unsigned(@nospecialize(x::SignedExtendedFloat))   = false

is_signed(@nospecialize(x::UnsignedFiniteFloat))     = false
is_signed(@nospecialize(x::UnsignedExtendedFloat))   = false
is_signed(@nospecialize(x::SignedFiniteFloat))       = true
is_signed(@nospecialize(x::SignedExtendedFloat))     = true

is_finite(@nospecialize(x::UnsignedFiniteFloat))     = true
is_finite(@nospecialize(x::UnsignedExtendedFloat))   = false
is_finite(@nospecialize(x::SignedFiniteFloat))       = true
is_finite(@nospecialize(x::SignedExtendedFloat))     = false

is_extended(@nospecialize(x::UnsignedFiniteFloat))   = false
is_extended(@nospecialize(x::UnsignedExtendedFloat)) = true
is_extended(@nospecialize(x::SignedFiniteFloat))     = false
is_extended(@nospecialize(x::SignedExtendedFloat))   = true


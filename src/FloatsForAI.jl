module FloatsForAI

export # abstract types
         AbstractAIFloat, AbstractUnsignedFloat, AbstractSignedFloat,
         AkoUnsignedFiniteFloat, AkoUnsignedExtendedFloat,
         AkoSignedFiniteFloat, AkoSignedExtendedFloat,
        # unions of abstract types
         AbstractUnsignedFloats, AbstractSignedFloats,
         AbstractFiniteFloats, AbstractExtendedFloats,
         # parameterized unions of abstract types
         AbstractUnsignedFloat, AbstractSignedFloat,
         AbstractFiniteFloat, AbstractExtendedFloat,
       # concrete types
         UnsignedFiniteFloat, UnsignedExtendedFloat,
         SignedFiniteFloat, SignedExtendedFloat,
         # unions of concrete types
         UnsignedFloats, SignedFloats,
         FiniteFloats, ExtendedFloats,
       # type predicates
         is_unsigned, is_signed, is_finite, is_extended,
         is_unsigned_finite, is_unsigned_extended,
         is_signed_finite, is_signed_extended,
       # type contexts
         bitwidth, precision, signedness, domain,
       # constants
         SmallBitwidthMin, SmallBitwidthMax, 
         MediumBitwidthMin, MediumBitwidthMax, 
         LargeBitwidthMin, LargeBitwidthMax,
         # predicates for constants
         is_bitwidth_valid, is_bitwidth_small, is_bitwidth_medium, is_bitwidth_large,

         # macros

       
using AlignedAllocs, FixedSizeArrays

include("constants.jl")
include("macros.jl")

include("abstract_types.jl"
)

include("types.jl")

end  # AI-Floats

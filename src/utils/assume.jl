# Copied from LLVM.jl/interop/intrinsics.jl

@inline assume(cond::Bool) = Base.llvmcall(("""
        declare void @llvm.assume(i1)

        define void @entry(i8) #0 {
            %cond = icmp eq i8 %0, 1
            call void @llvm.assume(i1 %cond)
            ret void
        }

        attributes #0 = { alwaysinline }""", "entry"),
    Nothing, Tuple{Bool}, cond)

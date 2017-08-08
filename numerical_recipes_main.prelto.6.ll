; ModuleID = 'numerical_recipes_main.prelto.6.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@nn1 = global i32 1, align 4
@nn2 = global i32 512, align 4
@nn3 = global i32 512, align 4
@.str = private unnamed_addr constant [7 x i8] c"fourn\0A\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"Copiando os dados para float\0A\00", align 1
@data = common global [1 x [512 x [512 x float]]] zeroinitializer, align 4
@.str2 = private unnamed_addr constant [21 x i8] c"Executando f3tensor\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"Executando matrix\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"rlft3-1\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"Freeing\0A\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@speq = common global [1 x [1024 x float]] zeroinitializer, align 4

; Function Attrs: noinline nounwind
define void @fourn(i32 %ndim, i32 %isign) #0 {
  %data = alloca [134 x float], align 4
  %nn = alloca [4 x i32], align 4
  %1 = bitcast [134 x float]* %data to i8*
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0)) #5
  %3 = icmp slt i32 %ndim, 1
  br i1 %3, label %._crit_edge27, label %.lr.ph31.preheader

.lr.ph31.preheader:                               ; preds = %0
  br label %.lr.ph31

.preheader6:                                      ; preds = %.lr.ph31
  %.lcssa = phi i32 [ %9, %.lr.ph31 ]
  %4 = icmp sgt i32 %ndim, 0
  br i1 %4, label %.lr.ph26, label %._crit_edge27

.lr.ph26:                                         ; preds = %.preheader6
  %5 = sitofp i32 %isign to double
  %6 = fmul double %5, 0x401921FB54442D1C
  br label %11

.lr.ph31:                                         ; preds = %.lr.ph31, %.lr.ph31.preheader
  %idim.029 = phi i32 [ %10, %.lr.ph31 ], [ 1, %.lr.ph31.preheader ]
  %ntot.028 = phi i32 [ %9, %.lr.ph31 ], [ 1, %.lr.ph31.preheader ]
  %7 = getelementptr inbounds [4 x i32]* %nn, i32 0, i32 %idim.029
  %8 = load i32* %7, align 4, !tbaa !1
  %9 = mul i32 %8, %ntot.028
  %10 = add nsw i32 %idim.029, 1
  %exitcond = icmp eq i32 %idim.029, %ndim
  br i1 %exitcond, label %.preheader6, label %.lr.ph31

; <label>:11                                      ; preds = %._crit_edge23, %.lr.ph26
  %idim.125 = phi i32 [ %ndim, %.lr.ph26 ], [ %101, %._crit_edge23 ]
  %nprev.024 = phi i32 [ 1, %.lr.ph26 ], [ %14, %._crit_edge23 ]
  %12 = getelementptr inbounds [4 x i32]* %nn, i32 0, i32 %idim.125
  %13 = load i32* %12, align 4, !tbaa !1
  %14 = mul i32 %13, %nprev.024
  %15 = udiv i32 %.lcssa, %14
  %16 = shl i32 %nprev.024, 1
  %17 = mul i32 %13, %16
  %18 = mul i32 %17, %15
  %19 = icmp eq i32 %17, 0
  br i1 %19, label %.preheader5, label %.lr.ph12

.lr.ph12:                                         ; preds = %11
  %20 = add i32 %16, -2
  br label %22

.preheader5.loopexit:                             ; preds = %43
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %11
  %21 = icmp ult i32 %16, %17
  br i1 %21, label %.lr.ph22.preheader, label %._crit_edge23

.lr.ph22.preheader:                               ; preds = %.preheader5
  br label %.lr.ph22

; <label>:22                                      ; preds = %43, %.lr.ph12
  %i2.010 = phi i32 [ 1, %.lr.ph12 ], [ %45, %43 ]
  %i2rev.09 = phi i32 [ 1, %.lr.ph12 ], [ %44, %43 ]
  %23 = icmp ugt i32 %i2rev.09, %i2.010
  br i1 %23, label %.preheader4, label %.preheader3.preheader

.preheader4:                                      ; preds = %22
  %overflow_intrinsic = zext i32 %20 to i33
  %overflow_intrinsic1 = zext i32 %i2.010 to i33
  %overflow_intrinsic2 = add i33 %overflow_intrinsic, %overflow_intrinsic1
  %overflow_intrinsic_sum = trunc i33 %overflow_intrinsic2 to i32
  %overflow_intrinsic3 = lshr i33 %overflow_intrinsic2, 32
  %overflow_intrinsic_carry = trunc i33 %overflow_intrinsic3 to i1
  br i1 %overflow_intrinsic_carry, label %.preheader3.preheader, label %.preheader2.lr.ph

.preheader2.lr.ph:                                ; preds = %.preheader4
  %24 = sub i32 %i2rev.09, %i2.010
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge, %.preheader2.lr.ph
  %i1.08 = phi i32 [ %i2.010, %.preheader2.lr.ph ], [ %39, %._crit_edge ]
  %25 = icmp ugt i32 %i1.08, %18
  br i1 %25, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %i3.07 = phi i32 [ %37, %.lr.ph ], [ %i1.08, %.lr.ph.preheader ]
  %26 = add i32 %24, %i3.07
  %27 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %i3.07
  %28 = load float* %27, align 4, !tbaa !5
  %29 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %26
  %30 = load float* %29, align 4, !tbaa !5
  store float %30, float* %27, align 4, !tbaa !5
  store float %28, float* %29, align 4, !tbaa !5
  %31 = add i32 %i3.07, 1
  %32 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %31
  %33 = load float* %32, align 4, !tbaa !5
  %34 = add i32 %26, 1
  %35 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %34
  %36 = load float* %35, align 4, !tbaa !5
  store float %36, float* %32, align 4, !tbaa !5
  store float %33, float* %35, align 4, !tbaa !5
  %37 = add i32 %i3.07, %17
  %38 = icmp ugt i32 %37, %18
  br i1 %38, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader2
  %39 = add i32 %i1.08, 2
  %40 = icmp ugt i32 %39, %overflow_intrinsic_sum
  br i1 %40, label %.preheader3.preheader.loopexit, label %.preheader2

.preheader3.preheader.loopexit:                   ; preds = %._crit_edge
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.loopexit, %.preheader4, %22
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3, %.preheader3.preheader
  %ibit.0.in = phi i32 [ %ibit.0, %.preheader3 ], [ %17, %.preheader3.preheader ]
  %i2rev.1 = phi i32 [ %42, %.preheader3 ], [ %i2rev.09, %.preheader3.preheader ]
  %ibit.0 = lshr i32 %ibit.0.in, 1
  %41 = icmp ugt i32 %i2rev.1, %ibit.0
  %not. = icmp uge i32 %ibit.0, %16
  %. = and i1 %41, %not.
  %42 = sub i32 %i2rev.1, %ibit.0
  br i1 %., label %.preheader3, label %43

; <label>:43                                      ; preds = %.preheader3
  %ibit.0.lcssa = phi i32 [ %ibit.0, %.preheader3 ]
  %i2rev.1.lcssa = phi i32 [ %i2rev.1, %.preheader3 ]
  %44 = add i32 %i2rev.1.lcssa, %ibit.0.lcssa
  %45 = add i32 %i2.010, %16
  %46 = icmp ugt i32 %45, %17
  br i1 %46, label %.preheader5.loopexit, label %22

.loopexit.loopexit:                               ; preds = %._crit_edge17
  br label %.loopexit

.loopexit:                                        ; preds = %.lr.ph22, %.loopexit.loopexit
  %47 = icmp ult i32 %48, %17
  br i1 %47, label %.lr.ph22, label %._crit_edge23.loopexit

.lr.ph22:                                         ; preds = %.loopexit, %.lr.ph22.preheader
  %ifp1.021 = phi i32 [ %48, %.loopexit ], [ %16, %.lr.ph22.preheader ]
  %48 = shl i32 %ifp1.021, 1
  %49 = udiv i32 %48, %16
  %50 = uitofp i32 %49 to double
  %51 = fdiv double %6, %50
  %52 = fptrunc double %51 to float
  %53 = fmul float %52, 5.000000e-01
  %54 = tail call float @sinf(float %53) #5
  %55 = fpext float %54 to double
  %56 = fmul double %55, -2.000000e+00
  %57 = fmul double %55, %56
  %58 = fptrunc double %57 to float
  %59 = tail call float @sinf(float %52) #5
  %60 = icmp eq i32 %ifp1.021, 0
  br i1 %60, label %.loopexit, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.lr.ph22
  br label %.preheader1

.preheader1:                                      ; preds = %._crit_edge17, %.preheader1.preheader
  %wr.020 = phi float [ %95, %._crit_edge17 ], [ 1.000000e+00, %.preheader1.preheader ]
  %wi.019 = phi float [ %99, %._crit_edge17 ], [ 0.000000e+00, %.preheader1.preheader ]
  %i3.118 = phi i32 [ %61, %._crit_edge17 ], [ 1, %.preheader1.preheader ]
  %61 = add i32 %i3.118, %16
  %62 = add i32 %61, -2
  %63 = icmp ugt i32 %i3.118, %62
  br i1 %63, label %._crit_edge17, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader1
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge15, %.preheader.preheader
  %i1.116 = phi i32 [ %90, %._crit_edge15 ], [ %i3.118, %.preheader.preheader ]
  %64 = icmp ugt i32 %i1.116, %18
  br i1 %64, label %._crit_edge15, label %.lr.ph14.preheader

.lr.ph14.preheader:                               ; preds = %.preheader
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14, %.lr.ph14.preheader
  %i2.113 = phi i32 [ %88, %.lr.ph14 ], [ %i1.116, %.lr.ph14.preheader ]
  %65 = add i32 %i2.113, %ifp1.021
  %66 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %65
  %67 = load float* %66, align 4, !tbaa !5
  %68 = fmul float %wr.020, %67
  %69 = add i32 %65, 1
  %70 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %69
  %71 = load float* %70, align 4, !tbaa !5
  %72 = fmul float %wi.019, %71
  %73 = fsub float %68, %72
  %74 = fmul float %wr.020, %71
  %75 = fmul float %wi.019, %67
  %76 = fadd float %75, %74
  %77 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %i2.113
  %78 = load float* %77, align 4, !tbaa !5
  %79 = fsub float %78, %73
  store float %79, float* %66, align 4, !tbaa !5
  %80 = add i32 %i2.113, 1
  %81 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %80
  %82 = load float* %81, align 4, !tbaa !5
  %83 = fsub float %82, %76
  store float %83, float* %70, align 4, !tbaa !5
  %84 = load float* %77, align 4, !tbaa !5
  %85 = fadd float %73, %84
  store float %85, float* %77, align 4, !tbaa !5
  %86 = load float* %81, align 4, !tbaa !5
  %87 = fadd float %76, %86
  store float %87, float* %81, align 4, !tbaa !5
  %88 = add i32 %i2.113, %48
  %89 = icmp ugt i32 %88, %18
  br i1 %89, label %._crit_edge15.loopexit, label %.lr.ph14

._crit_edge15.loopexit:                           ; preds = %.lr.ph14
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader
  %90 = add i32 %i1.116, 2
  %91 = icmp ugt i32 %90, %62
  br i1 %91, label %._crit_edge17.loopexit, label %.preheader

._crit_edge17.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader1
  %92 = fmul float %58, %wr.020
  %93 = fmul float %59, %wi.019
  %94 = fsub float %92, %93
  %95 = fadd float %wr.020, %94
  %96 = fmul float %58, %wi.019
  %97 = fmul float %59, %wr.020
  %98 = fadd float %96, %97
  %99 = fadd float %wi.019, %98
  %100 = icmp ugt i32 %61, %ifp1.021
  br i1 %100, label %.loopexit.loopexit, label %.preheader1

._crit_edge23.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader5
  %101 = add nsw i32 %idim.125, -1
  %102 = icmp sgt i32 %101, 0
  br i1 %102, label %11, label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %._crit_edge23
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.preheader6, %0
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare float @sinf(float) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind
define void @random_to_float(i32 %height, i32 %width) #0 {
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0)) #5
  %2 = icmp slt i32 %height, 1
  br i1 %2, label %._crit_edge4, label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %0
  %3 = icmp slt i32 %width, 1
  br i1 %3, label %.preheader.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader.lr.ph
  br label %.lr.ph

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.us.preheader
  %row_pos.02.us = phi i32 [ %4, %.preheader.us ], [ 1, %.preheader.us.preheader ]
  %4 = add nsw i32 %row_pos.02.us, 1
  %exitcond6 = icmp eq i32 %row_pos.02.us, %height
  br i1 %exitcond6, label %._crit_edge4.loopexit, label %.preheader.us

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %row_pos.02 = phi i32 [ %11, %._crit_edge ], [ 1, %.lr.ph.preheader ]
  %5 = sitofp i32 %row_pos.02 to float
  br label %6

; <label>:6                                       ; preds = %6, %.lr.ph
  %col_pos.01 = phi i32 [ 1, %.lr.ph ], [ %10, %6 ]
  %7 = sitofp i32 %col_pos.01 to float
  %8 = fmul float %5, %7
  %9 = getelementptr inbounds [1 x [512 x [512 x float]]]* @data, i32 1, i32 0, i32 %row_pos.02, i32 %col_pos.01
  store float %8, float* %9, align 4, !tbaa !5
  %10 = add nsw i32 %col_pos.01, 1
  %exitcond = icmp eq i32 %col_pos.01, %width
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %6
  %11 = add nsw i32 %row_pos.02, 1
  %exitcond5 = icmp eq i32 %row_pos.02, %height
  br i1 %exitcond5, label %._crit_edge4.loopexit8, label %.lr.ph

._crit_edge4.loopexit:                            ; preds = %.preheader.us
  br label %._crit_edge4

._crit_edge4.loopexit8:                           ; preds = %._crit_edge
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit8, %._crit_edge4.loopexit, %0
  ret void
}

; Function Attrs: noinline nounwind
define i32 @main() #0 {
  %1 = load i32* @nn3, align 4, !tbaa !1
  %2 = load i32* @nn2, align 4, !tbaa !1
  %3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0)) #5
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0)) #5
  tail call void @random_to_float(i32 %2, i32 %1) #6
  tail call void @fourn(i32 3, i32 1) #6
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0)) #5
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0)) #5
  %7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0)) #5
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0)) #5
  ret i32 0
}

; Function Attrs: nounwind readnone
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #4

attributes #0 = { noinline nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nobuiltin nounwind }
attributes #6 = { nobuiltin }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"int", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"float", metadata !3, i64 0}

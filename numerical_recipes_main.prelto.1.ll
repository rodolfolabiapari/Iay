; ModuleID = 'numerical_recipes_main.prelto.1.bc'
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
  call void @llvm.lifetime.start(i64 536, i8* %1) #1
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
  %idim.125 = phi i32 [ %ndim, %.lr.ph26 ], [ %103, %._crit_edge23 ]
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

.preheader5.loopexit:                             ; preds = %45
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %11
  %21 = icmp ult i32 %16, %17
  br i1 %21, label %.lr.ph22.preheader, label %._crit_edge23

.lr.ph22.preheader:                               ; preds = %.preheader5
  br label %.lr.ph22

; <label>:22                                      ; preds = %45, %.lr.ph12
  %i2.010 = phi i32 [ 1, %.lr.ph12 ], [ %47, %45 ]
  %i2rev.09 = phi i32 [ 1, %.lr.ph12 ], [ %46, %45 ]
  %23 = icmp ugt i32 %i2rev.09, %i2.010
  br i1 %23, label %.preheader4, label %.preheader3.preheader

.preheader4:                                      ; preds = %22
  %uadd = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %20, i32 %i2.010)
  %24 = extractvalue { i32, i1 } %uadd, 0
  %25 = extractvalue { i32, i1 } %uadd, 1
  br i1 %25, label %.preheader3.preheader, label %.preheader2.lr.ph

.preheader2.lr.ph:                                ; preds = %.preheader4
  %26 = sub i32 %i2rev.09, %i2.010
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge, %.preheader2.lr.ph
  %i1.08 = phi i32 [ %i2.010, %.preheader2.lr.ph ], [ %41, %._crit_edge ]
  %27 = icmp ugt i32 %i1.08, %18
  br i1 %27, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %i3.07 = phi i32 [ %39, %.lr.ph ], [ %i1.08, %.lr.ph.preheader ]
  %28 = add i32 %26, %i3.07
  %29 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %i3.07
  %30 = load float* %29, align 4, !tbaa !5
  %31 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %28
  %32 = load float* %31, align 4, !tbaa !5
  store float %32, float* %29, align 4, !tbaa !5
  store float %30, float* %31, align 4, !tbaa !5
  %33 = add i32 %i3.07, 1
  %34 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %33
  %35 = load float* %34, align 4, !tbaa !5
  %36 = add i32 %28, 1
  %37 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %36
  %38 = load float* %37, align 4, !tbaa !5
  store float %38, float* %34, align 4, !tbaa !5
  store float %35, float* %37, align 4, !tbaa !5
  %39 = add i32 %i3.07, %17
  %40 = icmp ugt i32 %39, %18
  br i1 %40, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader2
  %41 = add i32 %i1.08, 2
  %42 = icmp ugt i32 %41, %24
  br i1 %42, label %.preheader3.preheader.loopexit, label %.preheader2

.preheader3.preheader.loopexit:                   ; preds = %._crit_edge
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.loopexit, %.preheader4, %22
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3, %.preheader3.preheader
  %ibit.0.in = phi i32 [ %ibit.0, %.preheader3 ], [ %17, %.preheader3.preheader ]
  %i2rev.1 = phi i32 [ %44, %.preheader3 ], [ %i2rev.09, %.preheader3.preheader ]
  %ibit.0 = lshr i32 %ibit.0.in, 1
  %43 = icmp ugt i32 %i2rev.1, %ibit.0
  %not. = icmp uge i32 %ibit.0, %16
  %. = and i1 %43, %not.
  %44 = sub i32 %i2rev.1, %ibit.0
  br i1 %., label %.preheader3, label %45

; <label>:45                                      ; preds = %.preheader3
  %ibit.0.lcssa = phi i32 [ %ibit.0, %.preheader3 ]
  %i2rev.1.lcssa = phi i32 [ %i2rev.1, %.preheader3 ]
  %46 = add i32 %i2rev.1.lcssa, %ibit.0.lcssa
  %47 = add i32 %i2.010, %16
  %48 = icmp ugt i32 %47, %17
  br i1 %48, label %.preheader5.loopexit, label %22

.loopexit.loopexit:                               ; preds = %._crit_edge17
  br label %.loopexit

.loopexit:                                        ; preds = %.lr.ph22, %.loopexit.loopexit
  %49 = icmp ult i32 %50, %17
  br i1 %49, label %.lr.ph22, label %._crit_edge23.loopexit

.lr.ph22:                                         ; preds = %.loopexit, %.lr.ph22.preheader
  %ifp1.021 = phi i32 [ %50, %.loopexit ], [ %16, %.lr.ph22.preheader ]
  %50 = shl i32 %ifp1.021, 1
  %51 = udiv i32 %50, %16
  %52 = uitofp i32 %51 to double
  %53 = fdiv double %6, %52
  %54 = fptrunc double %53 to float
  %55 = fmul float %54, 5.000000e-01
  %56 = tail call float @sinf(float %55) #5
  %57 = fpext float %56 to double
  %58 = fmul double %57, -2.000000e+00
  %59 = fmul double %57, %58
  %60 = fptrunc double %59 to float
  %61 = tail call float @sinf(float %54) #5
  %62 = icmp eq i32 %ifp1.021, 0
  br i1 %62, label %.loopexit, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.lr.ph22
  br label %.preheader1

.preheader1:                                      ; preds = %._crit_edge17, %.preheader1.preheader
  %wr.020 = phi float [ %97, %._crit_edge17 ], [ 1.000000e+00, %.preheader1.preheader ]
  %wi.019 = phi float [ %101, %._crit_edge17 ], [ 0.000000e+00, %.preheader1.preheader ]
  %i3.118 = phi i32 [ %63, %._crit_edge17 ], [ 1, %.preheader1.preheader ]
  %63 = add i32 %i3.118, %16
  %64 = add i32 %63, -2
  %65 = icmp ugt i32 %i3.118, %64
  br i1 %65, label %._crit_edge17, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader1
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge15, %.preheader.preheader
  %i1.116 = phi i32 [ %92, %._crit_edge15 ], [ %i3.118, %.preheader.preheader ]
  %66 = icmp ugt i32 %i1.116, %18
  br i1 %66, label %._crit_edge15, label %.lr.ph14.preheader

.lr.ph14.preheader:                               ; preds = %.preheader
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14, %.lr.ph14.preheader
  %i2.113 = phi i32 [ %90, %.lr.ph14 ], [ %i1.116, %.lr.ph14.preheader ]
  %67 = add i32 %i2.113, %ifp1.021
  %68 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %67
  %69 = load float* %68, align 4, !tbaa !5
  %70 = fmul float %wr.020, %69
  %71 = add i32 %67, 1
  %72 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %71
  %73 = load float* %72, align 4, !tbaa !5
  %74 = fmul float %wi.019, %73
  %75 = fsub float %70, %74
  %76 = fmul float %wr.020, %73
  %77 = fmul float %wi.019, %69
  %78 = fadd float %77, %76
  %79 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %i2.113
  %80 = load float* %79, align 4, !tbaa !5
  %81 = fsub float %80, %75
  store float %81, float* %68, align 4, !tbaa !5
  %82 = add i32 %i2.113, 1
  %83 = getelementptr inbounds [134 x float]* %data, i32 0, i32 %82
  %84 = load float* %83, align 4, !tbaa !5
  %85 = fsub float %84, %78
  store float %85, float* %72, align 4, !tbaa !5
  %86 = load float* %79, align 4, !tbaa !5
  %87 = fadd float %75, %86
  store float %87, float* %79, align 4, !tbaa !5
  %88 = load float* %83, align 4, !tbaa !5
  %89 = fadd float %78, %88
  store float %89, float* %83, align 4, !tbaa !5
  %90 = add i32 %i2.113, %50
  %91 = icmp ugt i32 %90, %18
  br i1 %91, label %._crit_edge15.loopexit, label %.lr.ph14

._crit_edge15.loopexit:                           ; preds = %.lr.ph14
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader
  %92 = add i32 %i1.116, 2
  %93 = icmp ugt i32 %92, %64
  br i1 %93, label %._crit_edge17.loopexit, label %.preheader

._crit_edge17.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader1
  %94 = fmul float %60, %wr.020
  %95 = fmul float %61, %wi.019
  %96 = fsub float %94, %95
  %97 = fadd float %wr.020, %96
  %98 = fmul float %60, %wi.019
  %99 = fmul float %61, %wr.020
  %100 = fadd float %98, %99
  %101 = fadd float %wi.019, %100
  %102 = icmp ugt i32 %63, %ifp1.021
  br i1 %102, label %.loopexit.loopexit, label %.preheader1

._crit_edge23.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader5
  %103 = add nsw i32 %idim.125, -1
  %104 = icmp sgt i32 %103, 0
  br i1 %104, label %11, label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %._crit_edge23
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.preheader6, %0
  call void @llvm.lifetime.end(i64 536, i8* %1) #1
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

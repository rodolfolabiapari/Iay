; ModuleID = 'numerical_recipes_main.postlto.8.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%union.ieee_float_shape_type = type { float }

@nn2 = internal global i32 512, align 4
@nn3 = internal global i32 512, align 4
@.str = private unnamed_addr constant [7 x i8] c"fourn\0A\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"Copiando os dados para float\0A\00", align 1
@data = internal global [1 x [512 x [512 x float]]] zeroinitializer, align 4
@.str2 = private unnamed_addr constant [21 x i8] c"Executando f3tensor\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"Executando matrix\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"rlft3-1\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"Freeing\0A\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@npio2_hw = internal constant [32 x i32] [i32 1070141184, i32 1078529792, i32 1083624192, i32 1086918400, i32 1090212608, i32 1092012800, i32 1093659904, i32 1095307008, i32 1096954112, i32 1098601216, i32 1099577856, i32 1100401408, i32 1101224960, i32 1102048512, i32 1102872064, i32 1103695616, i32 1104519168, i32 1105342720, i32 1106166272, i32 1106989824, i32 1107554816, i32 1107966464, i32 1108378368, i32 1108790016, i32 1109201920, i32 1109613568, i32 1110025472, i32 1110437120, i32 1110849024, i32 1111260672, i32 1111672576, i32 1112084224], align 4
@two_over_pi = internal constant [198 x i32] [i32 162, i32 249, i32 131, i32 110, i32 78, i32 68, i32 21, i32 41, i32 252, i32 39, i32 87, i32 209, i32 245, i32 52, i32 221, i32 192, i32 219, i32 98, i32 149, i32 153, i32 60, i32 67, i32 144, i32 65, i32 254, i32 81, i32 99, i32 171, i32 222, i32 187, i32 197, i32 97, i32 183, i32 36, i32 110, i32 58, i32 66, i32 77, i32 210, i32 224, i32 6, i32 73, i32 46, i32 234, i32 9, i32 209, i32 146, i32 28, i32 254, i32 29, i32 235, i32 28, i32 177, i32 41, i32 167, i32 62, i32 232, i32 130, i32 53, i32 245, i32 46, i32 187, i32 68, i32 132, i32 233, i32 156, i32 112, i32 38, i32 180, i32 95, i32 126, i32 65, i32 57, i32 145, i32 214, i32 57, i32 131, i32 83, i32 57, i32 244, i32 156, i32 132, i32 95, i32 139, i32 189, i32 249, i32 40, i32 59, i32 31, i32 248, i32 151, i32 255, i32 222, i32 5, i32 152, i32 15, i32 239, i32 47, i32 17, i32 139, i32 90, i32 10, i32 109, i32 31, i32 109, i32 54, i32 126, i32 207, i32 39, i32 203, i32 9, i32 183, i32 79, i32 70, i32 63, i32 102, i32 158, i32 95, i32 234, i32 45, i32 117, i32 39, i32 186, i32 199, i32 235, i32 229, i32 241, i32 123, i32 61, i32 7, i32 57, i32 247, i32 138, i32 82, i32 146, i32 234, i32 107, i32 251, i32 95, i32 177, i32 31, i32 141, i32 93, i32 8, i32 86, i32 3, i32 48, i32 70, i32 252, i32 123, i32 107, i32 171, i32 240, i32 207, i32 188, i32 32, i32 154, i32 244, i32 54, i32 29, i32 169, i32 227, i32 145, i32 97, i32 94, i32 230, i32 27, i32 8, i32 101, i32 153, i32 133, i32 95, i32 20, i32 160, i32 104, i32 64, i32 141, i32 255, i32 216, i32 128, i32 77, i32 115, i32 39, i32 49, i32 6, i32 6, i32 21, i32 86, i32 202, i32 115, i32 168, i32 201, i32 96, i32 226, i32 123, i32 192, i32 140, i32 107], align 4
@init_jk = internal constant [3 x i32] [i32 4, i32 7, i32 9], align 4
@PIo2 = internal constant [11 x float] [float 0x3FF9200000000000, float 0x3F3E000000000000, float 0x3EFB400000000000, float 0x3E74400000000000, float 0x3DD0800000000000, float 0x3D6A000000000000, float 0x3CF8400000000000, float 0x3C5A000000000000, float 0x3BF8800000000000, float 0x3B78C00000000000, float 0x3AE8800000000000], align 4

; Function Attrs: noinline nounwind
define internal void @fourn(i32 %ndim, i32 %isign) #0 {
  %data = alloca [134 x float], align 4
  %nn = alloca [4 x i32], align 4
  %1 = bitcast [134 x float]* %data to i8*
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0)) #4
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
  %54 = tail call float @sinf(float %53) #4
  %55 = fpext float %54 to double
  %56 = fmul double %55, -2.000000e+00
  %57 = fmul double %55, %56
  %58 = fptrunc double %57 to float
  %59 = tail call float @sinf(float %52) #4
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

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal void @random_to_float(i32 %height, i32 %width) #0 {
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0)) #4
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
  %3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0)) #4
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0)) #4
  tail call void @random_to_float(i32 %2, i32 %1) #5
  tail call void @fourn(i32 3, i32 1) #5
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0)) #4
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0)) #4
  %7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0)) #4
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0)) #4
  ret i32 0
}

; Function Attrs: nounwind readnone
declare float @copysignf(float, float) #2

; Function Attrs: nounwind
define internal i32 @__ieee754_rem_pio2f(float %x, float* %y) #3 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca float*, align 4
  %z = alloca float, align 4
  %w = alloca float, align 4
  %t = alloca float, align 4
  %r = alloca float, align 4
  %fn = alloca float, align 4
  %tx = alloca [3 x float], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  %ix = alloca i32, align 4
  %hx = alloca i32, align 4
  %e0 = alloca i32, align 4
  %nx = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  %high = alloca i32, align 4
  %gf_u1 = alloca %union.ieee_float_shape_type, align 4
  %gf_u2 = alloca %union.ieee_float_shape_type, align 4
  %sf_u = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %2, align 4
  store float* %y, float** %3, align 4
  br label %4

; <label>:4                                       ; preds = %0
  %5 = load float* %2, align 4
  %6 = bitcast %union.ieee_float_shape_type* %gf_u to float*
  store float %5, float* %6, align 4
  %7 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %8 = load i32* %7, align 4
  store i32 %8, i32* %hx, align 4
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load i32* %hx, align 4
  %11 = and i32 %10, 2147483647
  store i32 %11, i32* %ix, align 4
  %12 = load i32* %ix, align 4
  %13 = icmp sle i32 %12, 1061752792
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %9
  %15 = load float* %2, align 4
  %16 = load float** %3, align 4
  %17 = getelementptr inbounds float* %16, i32 0
  store float %15, float* %17, align 4
  %18 = load float** %3, align 4
  %19 = getelementptr inbounds float* %18, i32 1
  store float 0.000000e+00, float* %19, align 4
  store i32 0, i32* %1
  br label %318

; <label>:20                                      ; preds = %9
  %21 = load i32* %ix, align 4
  %22 = icmp slt i32 %21, 1075235812
  br i1 %22, label %23, label %96

; <label>:23                                      ; preds = %20
  %24 = load i32* %hx, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %61

; <label>:26                                      ; preds = %23
  %27 = load float* %2, align 4
  %28 = fsub float %27, 0x3FF921F000000000
  store float %28, float* %z, align 4
  %29 = load i32* %ix, align 4
  %30 = and i32 %29, -16
  %31 = icmp ne i32 %30, 1070141392
  br i1 %31, label %32, label %45

; <label>:32                                      ; preds = %26
  %33 = load float* %z, align 4
  %34 = fsub float %33, 0x3EE6A88860000000
  %35 = load float** %3, align 4
  %36 = getelementptr inbounds float* %35, i32 0
  store float %34, float* %36, align 4
  %37 = load float* %z, align 4
  %38 = load float** %3, align 4
  %39 = getelementptr inbounds float* %38, i32 0
  %40 = load float* %39, align 4
  %41 = fsub float %37, %40
  %42 = fsub float %41, 0x3EE6A88860000000
  %43 = load float** %3, align 4
  %44 = getelementptr inbounds float* %43, i32 1
  store float %42, float* %44, align 4
  br label %60

; <label>:45                                      ; preds = %26
  %46 = load float* %z, align 4
  %47 = fsub float %46, 0x3EE6A88000000000
  store float %47, float* %z, align 4
  %48 = load float* %z, align 4
  %49 = fsub float %48, 0x3DD0B46100000000
  %50 = load float** %3, align 4
  %51 = getelementptr inbounds float* %50, i32 0
  store float %49, float* %51, align 4
  %52 = load float* %z, align 4
  %53 = load float** %3, align 4
  %54 = getelementptr inbounds float* %53, i32 0
  %55 = load float* %54, align 4
  %56 = fsub float %52, %55
  %57 = fsub float %56, 0x3DD0B46100000000
  %58 = load float** %3, align 4
  %59 = getelementptr inbounds float* %58, i32 1
  store float %57, float* %59, align 4
  br label %60

; <label>:60                                      ; preds = %45, %32
  store i32 1, i32* %1
  br label %318

; <label>:61                                      ; preds = %23
  %62 = load float* %2, align 4
  %63 = fadd float %62, 0x3FF921F000000000
  store float %63, float* %z, align 4
  %64 = load i32* %ix, align 4
  %65 = and i32 %64, -16
  %66 = icmp ne i32 %65, 1070141392
  br i1 %66, label %67, label %80

; <label>:67                                      ; preds = %61
  %68 = load float* %z, align 4
  %69 = fadd float %68, 0x3EE6A88860000000
  %70 = load float** %3, align 4
  %71 = getelementptr inbounds float* %70, i32 0
  store float %69, float* %71, align 4
  %72 = load float* %z, align 4
  %73 = load float** %3, align 4
  %74 = getelementptr inbounds float* %73, i32 0
  %75 = load float* %74, align 4
  %76 = fsub float %72, %75
  %77 = fadd float %76, 0x3EE6A88860000000
  %78 = load float** %3, align 4
  %79 = getelementptr inbounds float* %78, i32 1
  store float %77, float* %79, align 4
  br label %95

; <label>:80                                      ; preds = %61
  %81 = load float* %z, align 4
  %82 = fadd float %81, 0x3EE6A88000000000
  store float %82, float* %z, align 4
  %83 = load float* %z, align 4
  %84 = fadd float %83, 0x3DD0B46100000000
  %85 = load float** %3, align 4
  %86 = getelementptr inbounds float* %85, i32 0
  store float %84, float* %86, align 4
  %87 = load float* %z, align 4
  %88 = load float** %3, align 4
  %89 = getelementptr inbounds float* %88, i32 0
  %90 = load float* %89, align 4
  %91 = fsub float %87, %90
  %92 = fadd float %91, 0x3DD0B46100000000
  %93 = load float** %3, align 4
  %94 = getelementptr inbounds float* %93, i32 1
  store float %92, float* %94, align 4
  br label %95

; <label>:95                                      ; preds = %80, %67
  store i32 -1, i32* %1
  br label %318

; <label>:96                                      ; preds = %20
  %97 = load i32* %ix, align 4
  %98 = icmp sle i32 %97, 1128861568
  br i1 %98, label %99, label %239

; <label>:99                                      ; preds = %96
  %100 = load float* %2, align 4
  %101 = call float @fabsf(float %100) #6
  store float %101, float* %t, align 4
  %102 = load float* %t, align 4
  %103 = fmul float %102, 0x3FE45F3080000000
  %104 = fadd float %103, 5.000000e-01
  %105 = fptosi float %104 to i32
  store i32 %105, i32* %n, align 4
  %106 = load i32* %n, align 4
  %107 = sitofp i32 %106 to float
  store float %107, float* %fn, align 4
  %108 = load float* %t, align 4
  %109 = load float* %fn, align 4
  %110 = fmul float %109, 0x3FF921F000000000
  %111 = fsub float %108, %110
  store float %111, float* %r, align 4
  %112 = load float* %fn, align 4
  %113 = fmul float %112, 0x3EE6A88860000000
  store float %113, float* %w, align 4
  %114 = load i32* %n, align 4
  %115 = icmp slt i32 %114, 32
  br i1 %115, label %116, label %130

; <label>:116                                     ; preds = %99
  %117 = load i32* %ix, align 4
  %118 = and i32 %117, -256
  %119 = load i32* %n, align 4
  %120 = sub nsw i32 %119, 1
  %121 = getelementptr inbounds [32 x i32]* @npio2_hw, i32 0, i32 %120
  %122 = load i32* %121, align 4
  %123 = icmp ne i32 %118, %122
  br i1 %123, label %124, label %130

; <label>:124                                     ; preds = %116
  %125 = load float* %r, align 4
  %126 = load float* %w, align 4
  %127 = fsub float %125, %126
  %128 = load float** %3, align 4
  %129 = getelementptr inbounds float* %128, i32 0
  store float %127, float* %129, align 4
  br label %210

; <label>:130                                     ; preds = %116, %99
  %131 = load i32* %ix, align 4
  %132 = ashr i32 %131, 23
  store i32 %132, i32* %j, align 4
  %133 = load float* %r, align 4
  %134 = load float* %w, align 4
  %135 = fsub float %133, %134
  %136 = load float** %3, align 4
  %137 = getelementptr inbounds float* %136, i32 0
  store float %135, float* %137, align 4
  br label %138

; <label>:138                                     ; preds = %130
  %139 = load float** %3, align 4
  %140 = getelementptr inbounds float* %139, i32 0
  %141 = load float* %140, align 4
  %142 = bitcast %union.ieee_float_shape_type* %gf_u1 to float*
  store float %141, float* %142, align 4
  %143 = bitcast %union.ieee_float_shape_type* %gf_u1 to i32*
  %144 = load i32* %143, align 4
  store i32 %144, i32* %high, align 4
  br label %145

; <label>:145                                     ; preds = %138
  %146 = load i32* %j, align 4
  %147 = load i32* %high, align 4
  %148 = lshr i32 %147, 23
  %149 = and i32 %148, 255
  %150 = sub i32 %146, %149
  store i32 %150, i32* %i, align 4
  %151 = load i32* %i, align 4
  %152 = icmp sgt i32 %151, 8
  br i1 %152, label %153, label %209

; <label>:153                                     ; preds = %145
  %154 = load float* %r, align 4
  store float %154, float* %t, align 4
  %155 = load float* %fn, align 4
  %156 = fmul float %155, 0x3EE6A88000000000
  store float %156, float* %w, align 4
  %157 = load float* %t, align 4
  %158 = load float* %w, align 4
  %159 = fsub float %157, %158
  store float %159, float* %r, align 4
  %160 = load float* %fn, align 4
  %161 = fmul float %160, 0x3DD0B46100000000
  %162 = load float* %t, align 4
  %163 = load float* %r, align 4
  %164 = fsub float %162, %163
  %165 = load float* %w, align 4
  %166 = fsub float %164, %165
  %167 = fsub float %161, %166
  store float %167, float* %w, align 4
  %168 = load float* %r, align 4
  %169 = load float* %w, align 4
  %170 = fsub float %168, %169
  %171 = load float** %3, align 4
  %172 = getelementptr inbounds float* %171, i32 0
  store float %170, float* %172, align 4
  br label %173

; <label>:173                                     ; preds = %153
  %174 = load float** %3, align 4
  %175 = getelementptr inbounds float* %174, i32 0
  %176 = load float* %175, align 4
  %177 = bitcast %union.ieee_float_shape_type* %gf_u2 to float*
  store float %176, float* %177, align 4
  %178 = bitcast %union.ieee_float_shape_type* %gf_u2 to i32*
  %179 = load i32* %178, align 4
  store i32 %179, i32* %high, align 4
  br label %180

; <label>:180                                     ; preds = %173
  %181 = load i32* %j, align 4
  %182 = load i32* %high, align 4
  %183 = lshr i32 %182, 23
  %184 = and i32 %183, 255
  %185 = sub i32 %181, %184
  store i32 %185, i32* %i, align 4
  %186 = load i32* %i, align 4
  %187 = icmp sgt i32 %186, 25
  br i1 %187, label %188, label %208

; <label>:188                                     ; preds = %180
  %189 = load float* %r, align 4
  store float %189, float* %t, align 4
  %190 = load float* %fn, align 4
  %191 = fmul float %190, 0x3DD0B46000000000
  store float %191, float* %w, align 4
  %192 = load float* %t, align 4
  %193 = load float* %w, align 4
  %194 = fsub float %192, %193
  store float %194, float* %r, align 4
  %195 = load float* %fn, align 4
  %196 = fmul float %195, 0x3C91A62640000000
  %197 = load float* %t, align 4
  %198 = load float* %r, align 4
  %199 = fsub float %197, %198
  %200 = load float* %w, align 4
  %201 = fsub float %199, %200
  %202 = fsub float %196, %201
  store float %202, float* %w, align 4
  %203 = load float* %r, align 4
  %204 = load float* %w, align 4
  %205 = fsub float %203, %204
  %206 = load float** %3, align 4
  %207 = getelementptr inbounds float* %206, i32 0
  store float %205, float* %207, align 4
  br label %208

; <label>:208                                     ; preds = %188, %180
  br label %209

; <label>:209                                     ; preds = %208, %145
  br label %210

; <label>:210                                     ; preds = %209, %124
  %211 = load float* %r, align 4
  %212 = load float** %3, align 4
  %213 = getelementptr inbounds float* %212, i32 0
  %214 = load float* %213, align 4
  %215 = fsub float %211, %214
  %216 = load float* %w, align 4
  %217 = fsub float %215, %216
  %218 = load float** %3, align 4
  %219 = getelementptr inbounds float* %218, i32 1
  store float %217, float* %219, align 4
  %220 = load i32* %hx, align 4
  %221 = icmp slt i32 %220, 0
  br i1 %221, label %222, label %237

; <label>:222                                     ; preds = %210
  %223 = load float** %3, align 4
  %224 = getelementptr inbounds float* %223, i32 0
  %225 = load float* %224, align 4
  %226 = fsub float -0.000000e+00, %225
  %227 = load float** %3, align 4
  %228 = getelementptr inbounds float* %227, i32 0
  store float %226, float* %228, align 4
  %229 = load float** %3, align 4
  %230 = getelementptr inbounds float* %229, i32 1
  %231 = load float* %230, align 4
  %232 = fsub float -0.000000e+00, %231
  %233 = load float** %3, align 4
  %234 = getelementptr inbounds float* %233, i32 1
  store float %232, float* %234, align 4
  %235 = load i32* %n, align 4
  %236 = sub nsw i32 0, %235
  store i32 %236, i32* %1
  br label %318

; <label>:237                                     ; preds = %210
  %238 = load i32* %n, align 4
  store i32 %238, i32* %1
  br label %318

; <label>:239                                     ; preds = %96
  %240 = load i32* %ix, align 4
  %241 = icmp slt i32 %240, 2139095040
  br i1 %241, label %250, label %242

; <label>:242                                     ; preds = %239
  %243 = load float* %2, align 4
  %244 = load float* %2, align 4
  %245 = fsub float %243, %244
  %246 = load float** %3, align 4
  %247 = getelementptr inbounds float* %246, i32 1
  store float %245, float* %247, align 4
  %248 = load float** %3, align 4
  %249 = getelementptr inbounds float* %248, i32 0
  store float %245, float* %249, align 4
  store i32 0, i32* %1
  br label %318

; <label>:250                                     ; preds = %239
  %251 = load i32* %ix, align 4
  %252 = ashr i32 %251, 23
  %253 = sub nsw i32 %252, 134
  store i32 %253, i32* %e0, align 4
  br label %254

; <label>:254                                     ; preds = %250
  %255 = load i32* %ix, align 4
  %256 = load i32* %e0, align 4
  %257 = shl i32 %256, 23
  %258 = sub nsw i32 %255, %257
  %259 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %258, i32* %259, align 4
  %260 = bitcast %union.ieee_float_shape_type* %sf_u to float*
  %261 = load float* %260, align 4
  store float %261, float* %z, align 4
  br label %262

; <label>:262                                     ; preds = %254
  store i32 0, i32* %i, align 4
  br label %263

; <label>:263                                     ; preds = %278, %262
  %264 = load i32* %i, align 4
  %265 = icmp slt i32 %264, 2
  br i1 %265, label %266, label %281

; <label>:266                                     ; preds = %263
  %267 = load float* %z, align 4
  %268 = fptosi float %267 to i32
  %269 = sitofp i32 %268 to float
  %270 = load i32* %i, align 4
  %271 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 %270
  store float %269, float* %271, align 4
  %272 = load float* %z, align 4
  %273 = load i32* %i, align 4
  %274 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 %273
  %275 = load float* %274, align 4
  %276 = fsub float %272, %275
  %277 = fmul float %276, 2.560000e+02
  store float %277, float* %z, align 4
  br label %278

; <label>:278                                     ; preds = %266
  %279 = load i32* %i, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, i32* %i, align 4
  br label %263

; <label>:281                                     ; preds = %263
  %282 = load float* %z, align 4
  %283 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 2
  store float %282, float* %283, align 4
  store i32 3, i32* %nx, align 4
  br label %284

; <label>:284                                     ; preds = %290, %281
  %285 = load i32* %nx, align 4
  %286 = sub nsw i32 %285, 1
  %287 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 %286
  %288 = load float* %287, align 4
  %289 = fcmp oeq float %288, 0.000000e+00
  br i1 %289, label %290, label %293

; <label>:290                                     ; preds = %284
  %291 = load i32* %nx, align 4
  %292 = add nsw i32 %291, -1
  store i32 %292, i32* %nx, align 4
  br label %284

; <label>:293                                     ; preds = %284
  %294 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 0
  %295 = load float** %3, align 4
  %296 = load i32* %e0, align 4
  %297 = load i32* %nx, align 4
  %298 = call i32 @__kernel_rem_pio2f(float* %294, float* %295, i32 %296, i32 %297, i32 2, i32* getelementptr inbounds ([198 x i32]* @two_over_pi, i32 0, i32 0)) #5
  store i32 %298, i32* %n, align 4
  %299 = load i32* %hx, align 4
  %300 = icmp slt i32 %299, 0
  br i1 %300, label %301, label %316

; <label>:301                                     ; preds = %293
  %302 = load float** %3, align 4
  %303 = getelementptr inbounds float* %302, i32 0
  %304 = load float* %303, align 4
  %305 = fsub float -0.000000e+00, %304
  %306 = load float** %3, align 4
  %307 = getelementptr inbounds float* %306, i32 0
  store float %305, float* %307, align 4
  %308 = load float** %3, align 4
  %309 = getelementptr inbounds float* %308, i32 1
  %310 = load float* %309, align 4
  %311 = fsub float -0.000000e+00, %310
  %312 = load float** %3, align 4
  %313 = getelementptr inbounds float* %312, i32 1
  store float %311, float* %313, align 4
  %314 = load i32* %n, align 4
  %315 = sub nsw i32 0, %314
  store i32 %315, i32* %1
  br label %318

; <label>:316                                     ; preds = %293
  %317 = load i32* %n, align 4
  store i32 %317, i32* %1
  br label %318

; <label>:318                                     ; preds = %316, %301, %242, %237, %222, %95, %60, %14
  %319 = load i32* %1
  ret i32 %319
}

; Function Attrs: nounwind
define internal float @__kernel_cosf(float %x, float %y) #3 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %a = alloca float, align 4
  %hz = alloca float, align 4
  %z = alloca float, align 4
  %r = alloca float, align 4
  %qx = alloca float, align 4
  %ix = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  %sf_u = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %2, align 4
  store float %y, float* %3, align 4
  br label %4

; <label>:4                                       ; preds = %0
  %5 = load float* %2, align 4
  %6 = bitcast %union.ieee_float_shape_type* %gf_u to float*
  store float %5, float* %6, align 4
  %7 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %8 = load i32* %7, align 4
  store i32 %8, i32* %ix, align 4
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load i32* %ix, align 4
  %11 = and i32 %10, 2147483647
  store i32 %11, i32* %ix, align 4
  %12 = load i32* %ix, align 4
  %13 = icmp slt i32 %12, 838860800
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %9
  %15 = load float* %2, align 4
  %16 = fptosi float %15 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %14
  store float 1.000000e+00, float* %1
  br label %85

; <label>:19                                      ; preds = %14
  br label %20

; <label>:20                                      ; preds = %19, %9
  %21 = load float* %2, align 4
  %22 = load float* %2, align 4
  %23 = fmul float %21, %22
  store float %23, float* %z, align 4
  %24 = load float* %z, align 4
  %25 = load float* %z, align 4
  %26 = load float* %z, align 4
  %27 = load float* %z, align 4
  %28 = load float* %z, align 4
  %29 = load float* %z, align 4
  %30 = fmul float %29, 0xBDA8FAE9C0000000
  %31 = fadd float 0x3E21EE9EC0000000, %30
  %32 = fmul float %28, %31
  %33 = fadd float 0xBE927E4F80000000, %32
  %34 = fmul float %27, %33
  %35 = fadd float 0x3EFA01A020000000, %34
  %36 = fmul float %26, %35
  %37 = fadd float 0xBF56C16C20000000, %36
  %38 = fmul float %25, %37
  %39 = fadd float 0x3FA5555560000000, %38
  %40 = fmul float %24, %39
  store float %40, float* %r, align 4
  %41 = load i32* %ix, align 4
  %42 = icmp slt i32 %41, 1050253722
  br i1 %42, label %43, label %55

; <label>:43                                      ; preds = %20
  %44 = load float* %z, align 4
  %45 = fmul float 5.000000e-01, %44
  %46 = load float* %z, align 4
  %47 = load float* %r, align 4
  %48 = fmul float %46, %47
  %49 = load float* %2, align 4
  %50 = load float* %3, align 4
  %51 = fmul float %49, %50
  %52 = fsub float %48, %51
  %53 = fsub float %45, %52
  %54 = fsub float 1.000000e+00, %53
  store float %54, float* %1
  br label %85

; <label>:55                                      ; preds = %20
  %56 = load i32* %ix, align 4
  %57 = icmp sgt i32 %56, 1061683200
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %55
  store float 2.812500e-01, float* %qx, align 4
  br label %67

; <label>:59                                      ; preds = %55
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32* %ix, align 4
  %62 = sub nsw i32 %61, 16777216
  %63 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %62, i32* %63, align 4
  %64 = bitcast %union.ieee_float_shape_type* %sf_u to float*
  %65 = load float* %64, align 4
  store float %65, float* %qx, align 4
  br label %66

; <label>:66                                      ; preds = %60
  br label %67

; <label>:67                                      ; preds = %66, %58
  %68 = load float* %z, align 4
  %69 = fmul float 5.000000e-01, %68
  %70 = load float* %qx, align 4
  %71 = fsub float %69, %70
  store float %71, float* %hz, align 4
  %72 = load float* %qx, align 4
  %73 = fsub float 1.000000e+00, %72
  store float %73, float* %a, align 4
  %74 = load float* %a, align 4
  %75 = load float* %hz, align 4
  %76 = load float* %z, align 4
  %77 = load float* %r, align 4
  %78 = fmul float %76, %77
  %79 = load float* %2, align 4
  %80 = load float* %3, align 4
  %81 = fmul float %79, %80
  %82 = fsub float %78, %81
  %83 = fsub float %75, %82
  %84 = fsub float %74, %83
  store float %84, float* %1
  br label %85

; <label>:85                                      ; preds = %67, %43, %18
  %86 = load float* %1
  ret float %86
}

; Function Attrs: nounwind
define internal i32 @__kernel_rem_pio2f(float* %x, float* %y, i32 %e0, i32 %nx, i32 %prec, i32* %ipio2) #3 {
  %1 = alloca float*, align 4
  %2 = alloca float*, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 4
  %jz = alloca i32, align 4
  %jx = alloca i32, align 4
  %jv = alloca i32, align 4
  %jp = alloca i32, align 4
  %jk = alloca i32, align 4
  %carry = alloca i32, align 4
  %n = alloca i32, align 4
  %iq = alloca [20 x i32], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %m = alloca i32, align 4
  %q0 = alloca i32, align 4
  %ih = alloca i32, align 4
  %z = alloca float, align 4
  %fw = alloca float, align 4
  %f = alloca [20 x float], align 4
  %fq = alloca [20 x float], align 4
  %q = alloca [20 x float], align 4
  store float* %x, float** %1, align 4
  store float* %y, float** %2, align 4
  store i32 %e0, i32* %3, align 4
  store i32 %nx, i32* %4, align 4
  store i32 %prec, i32* %5, align 4
  store i32* %ipio2, i32** %6, align 4
  %7 = load i32* %5, align 4
  %8 = getelementptr inbounds [3 x i32]* @init_jk, i32 0, i32 %7
  %9 = load i32* %8, align 4
  store i32 %9, i32* %jk, align 4
  %10 = load i32* %jk, align 4
  store i32 %10, i32* %jp, align 4
  %11 = load i32* %4, align 4
  %12 = sub nsw i32 %11, 1
  store i32 %12, i32* %jx, align 4
  %13 = load i32* %3, align 4
  %14 = sub nsw i32 %13, 3
  %15 = sdiv i32 %14, 8
  store i32 %15, i32* %jv, align 4
  %16 = load i32* %jv, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %0
  store i32 0, i32* %jv, align 4
  br label %19

; <label>:19                                      ; preds = %18, %0
  %20 = load i32* %3, align 4
  %21 = load i32* %jv, align 4
  %22 = add nsw i32 %21, 1
  %23 = mul nsw i32 8, %22
  %24 = sub nsw i32 %20, %23
  store i32 %24, i32* %q0, align 4
  %25 = load i32* %jv, align 4
  %26 = load i32* %jx, align 4
  %27 = sub nsw i32 %25, %26
  store i32 %27, i32* %j, align 4
  %28 = load i32* %jx, align 4
  %29 = load i32* %jk, align 4
  %30 = add nsw i32 %28, %29
  store i32 %30, i32* %m, align 4
  store i32 0, i32* %i, align 4
  br label %31

; <label>:31                                      ; preds = %49, %19
  %32 = load i32* %i, align 4
  %33 = load i32* %m, align 4
  %34 = icmp sle i32 %32, %33
  br i1 %34, label %35, label %54

; <label>:35                                      ; preds = %31
  %36 = load i32* %j, align 4
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %35
  br label %45

; <label>:39                                      ; preds = %35
  %40 = load i32* %j, align 4
  %41 = load i32** %6, align 4
  %42 = getelementptr inbounds i32* %41, i32 %40
  %43 = load i32* %42, align 4
  %44 = sitofp i32 %43 to float
  br label %45

; <label>:45                                      ; preds = %39, %38
  %46 = phi float [ 0.000000e+00, %38 ], [ %44, %39 ]
  %47 = load i32* %i, align 4
  %48 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %47
  store float %46, float* %48, align 4
  br label %49

; <label>:49                                      ; preds = %45
  %50 = load i32* %i, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %i, align 4
  %52 = load i32* %j, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %j, align 4
  br label %31

; <label>:54                                      ; preds = %31
  store i32 0, i32* %i, align 4
  br label %55

; <label>:55                                      ; preds = %86, %54
  %56 = load i32* %i, align 4
  %57 = load i32* %jk, align 4
  %58 = icmp sle i32 %56, %57
  br i1 %58, label %59, label %89

; <label>:59                                      ; preds = %55
  store i32 0, i32* %j, align 4
  store float 0.000000e+00, float* %fw, align 4
  br label %60

; <label>:60                                      ; preds = %79, %59
  %61 = load i32* %j, align 4
  %62 = load i32* %jx, align 4
  %63 = icmp sle i32 %61, %62
  br i1 %63, label %64, label %82

; <label>:64                                      ; preds = %60
  %65 = load i32* %j, align 4
  %66 = load float** %1, align 4
  %67 = getelementptr inbounds float* %66, i32 %65
  %68 = load float* %67, align 4
  %69 = load i32* %jx, align 4
  %70 = load i32* %i, align 4
  %71 = add nsw i32 %69, %70
  %72 = load i32* %j, align 4
  %73 = sub nsw i32 %71, %72
  %74 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %73
  %75 = load float* %74, align 4
  %76 = fmul float %68, %75
  %77 = load float* %fw, align 4
  %78 = fadd float %77, %76
  store float %78, float* %fw, align 4
  br label %79

; <label>:79                                      ; preds = %64
  %80 = load i32* %j, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %j, align 4
  br label %60

; <label>:82                                      ; preds = %60
  %83 = load float* %fw, align 4
  %84 = load i32* %i, align 4
  %85 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %84
  store float %83, float* %85, align 4
  br label %86

; <label>:86                                      ; preds = %82
  %87 = load i32* %i, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %i, align 4
  br label %55

; <label>:89                                      ; preds = %55
  %90 = load i32* %jk, align 4
  store i32 %90, i32* %jz, align 4
  br label %91

; <label>:91                                      ; preds = %333, %89
  store i32 0, i32* %i, align 4
  %92 = load i32* %jz, align 4
  store i32 %92, i32* %j, align 4
  %93 = load i32* %jz, align 4
  %94 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %93
  %95 = load float* %94, align 4
  store float %95, float* %z, align 4
  br label %96

; <label>:96                                      ; preds = %117, %91
  %97 = load i32* %j, align 4
  %98 = icmp sgt i32 %97, 0
  br i1 %98, label %99, label %122

; <label>:99                                      ; preds = %96
  %100 = load float* %z, align 4
  %101 = fmul float 3.906250e-03, %100
  %102 = fptosi float %101 to i32
  %103 = sitofp i32 %102 to float
  store float %103, float* %fw, align 4
  %104 = load float* %z, align 4
  %105 = load float* %fw, align 4
  %106 = fmul float 2.560000e+02, %105
  %107 = fsub float %104, %106
  %108 = fptosi float %107 to i32
  %109 = load i32* %i, align 4
  %110 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %109
  store i32 %108, i32* %110, align 4
  %111 = load i32* %j, align 4
  %112 = sub nsw i32 %111, 1
  %113 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %112
  %114 = load float* %113, align 4
  %115 = load float* %fw, align 4
  %116 = fadd float %114, %115
  store float %116, float* %z, align 4
  br label %117

; <label>:117                                     ; preds = %99
  %118 = load i32* %i, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %i, align 4
  %120 = load i32* %j, align 4
  %121 = add nsw i32 %120, -1
  store i32 %121, i32* %j, align 4
  br label %96

; <label>:122                                     ; preds = %96
  %123 = load float* %z, align 4
  %124 = load i32* %q0, align 4
  %125 = call float @scalbnf(float %123, i32 %124) #4
  store float %125, float* %z, align 4
  %126 = load float* %z, align 4
  %127 = fmul float %126, 1.250000e-01
  %128 = call float @floorf(float %127) #6
  %129 = fmul float 8.000000e+00, %128
  %130 = load float* %z, align 4
  %131 = fsub float %130, %129
  store float %131, float* %z, align 4
  %132 = load float* %z, align 4
  %133 = fptosi float %132 to i32
  store i32 %133, i32* %n, align 4
  %134 = load i32* %n, align 4
  %135 = sitofp i32 %134 to float
  %136 = load float* %z, align 4
  %137 = fsub float %136, %135
  store float %137, float* %z, align 4
  store i32 0, i32* %ih, align 4
  %138 = load i32* %q0, align 4
  %139 = icmp sgt i32 %138, 0
  br i1 %139, label %140, label %167

; <label>:140                                     ; preds = %122
  %141 = load i32* %jz, align 4
  %142 = sub nsw i32 %141, 1
  %143 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %142
  %144 = load i32* %143, align 4
  %145 = load i32* %q0, align 4
  %146 = sub nsw i32 8, %145
  %147 = ashr i32 %144, %146
  store i32 %147, i32* %i, align 4
  %148 = load i32* %i, align 4
  %149 = load i32* %n, align 4
  %150 = add nsw i32 %149, %148
  store i32 %150, i32* %n, align 4
  %151 = load i32* %i, align 4
  %152 = load i32* %q0, align 4
  %153 = sub nsw i32 8, %152
  %154 = shl i32 %151, %153
  %155 = load i32* %jz, align 4
  %156 = sub nsw i32 %155, 1
  %157 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %156
  %158 = load i32* %157, align 4
  %159 = sub nsw i32 %158, %154
  store i32 %159, i32* %157, align 4
  %160 = load i32* %jz, align 4
  %161 = sub nsw i32 %160, 1
  %162 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %161
  %163 = load i32* %162, align 4
  %164 = load i32* %q0, align 4
  %165 = sub nsw i32 7, %164
  %166 = ashr i32 %163, %165
  store i32 %166, i32* %ih, align 4
  br label %182

; <label>:167                                     ; preds = %122
  %168 = load i32* %q0, align 4
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %176

; <label>:170                                     ; preds = %167
  %171 = load i32* %jz, align 4
  %172 = sub nsw i32 %171, 1
  %173 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %172
  %174 = load i32* %173, align 4
  %175 = ashr i32 %174, 8
  store i32 %175, i32* %ih, align 4
  br label %181

; <label>:176                                     ; preds = %167
  %177 = load float* %z, align 4
  %178 = fcmp oge float %177, 5.000000e-01
  br i1 %178, label %179, label %180

; <label>:179                                     ; preds = %176
  store i32 2, i32* %ih, align 4
  br label %180

; <label>:180                                     ; preds = %179, %176
  br label %181

; <label>:181                                     ; preds = %180, %170
  br label %182

; <label>:182                                     ; preds = %181, %140
  %183 = load i32* %ih, align 4
  %184 = icmp sgt i32 %183, 0
  br i1 %184, label %185, label %249

; <label>:185                                     ; preds = %182
  %186 = load i32* %n, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %n, align 4
  store i32 0, i32* %carry, align 4
  store i32 0, i32* %i, align 4
  br label %188

; <label>:188                                     ; preds = %213, %185
  %189 = load i32* %i, align 4
  %190 = load i32* %jz, align 4
  %191 = icmp slt i32 %189, %190
  br i1 %191, label %192, label %216

; <label>:192                                     ; preds = %188
  %193 = load i32* %i, align 4
  %194 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %193
  %195 = load i32* %194, align 4
  store i32 %195, i32* %j, align 4
  %196 = load i32* %carry, align 4
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %207

; <label>:198                                     ; preds = %192
  %199 = load i32* %j, align 4
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %206

; <label>:201                                     ; preds = %198
  store i32 1, i32* %carry, align 4
  %202 = load i32* %j, align 4
  %203 = sub nsw i32 256, %202
  %204 = load i32* %i, align 4
  %205 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %204
  store i32 %203, i32* %205, align 4
  br label %206

; <label>:206                                     ; preds = %201, %198
  br label %212

; <label>:207                                     ; preds = %192
  %208 = load i32* %j, align 4
  %209 = sub nsw i32 255, %208
  %210 = load i32* %i, align 4
  %211 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %210
  store i32 %209, i32* %211, align 4
  br label %212

; <label>:212                                     ; preds = %207, %206
  br label %213

; <label>:213                                     ; preds = %212
  %214 = load i32* %i, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %i, align 4
  br label %188

; <label>:216                                     ; preds = %188
  %217 = load i32* %q0, align 4
  %218 = icmp sgt i32 %217, 0
  br i1 %218, label %219, label %234

; <label>:219                                     ; preds = %216
  %220 = load i32* %q0, align 4
  switch i32 %220, label %233 [
    i32 1, label %221
    i32 2, label %227
  ]

; <label>:221                                     ; preds = %219
  %222 = load i32* %jz, align 4
  %223 = sub nsw i32 %222, 1
  %224 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %223
  %225 = load i32* %224, align 4
  %226 = and i32 %225, 127
  store i32 %226, i32* %224, align 4
  br label %233

; <label>:227                                     ; preds = %219
  %228 = load i32* %jz, align 4
  %229 = sub nsw i32 %228, 1
  %230 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %229
  %231 = load i32* %230, align 4
  %232 = and i32 %231, 63
  store i32 %232, i32* %230, align 4
  br label %233

; <label>:233                                     ; preds = %227, %221, %219
  br label %234

; <label>:234                                     ; preds = %233, %216
  %235 = load i32* %ih, align 4
  %236 = icmp eq i32 %235, 2
  br i1 %236, label %237, label %248

; <label>:237                                     ; preds = %234
  %238 = load float* %z, align 4
  %239 = fsub float 1.000000e+00, %238
  store float %239, float* %z, align 4
  %240 = load i32* %carry, align 4
  %241 = icmp ne i32 %240, 0
  br i1 %241, label %242, label %247

; <label>:242                                     ; preds = %237
  %243 = load i32* %q0, align 4
  %244 = call float @scalbnf(float 1.000000e+00, i32 %243) #4
  %245 = load float* %z, align 4
  %246 = fsub float %245, %244
  store float %246, float* %z, align 4
  br label %247

; <label>:247                                     ; preds = %242, %237
  br label %248

; <label>:248                                     ; preds = %247, %234
  br label %249

; <label>:249                                     ; preds = %248, %182
  %250 = load float* %z, align 4
  %251 = fcmp oeq float %250, 0.000000e+00
  br i1 %251, label %252, label %338

; <label>:252                                     ; preds = %249
  store i32 0, i32* %j, align 4
  %253 = load i32* %jz, align 4
  %254 = sub nsw i32 %253, 1
  store i32 %254, i32* %i, align 4
  br label %255

; <label>:255                                     ; preds = %265, %252
  %256 = load i32* %i, align 4
  %257 = load i32* %jk, align 4
  %258 = icmp sge i32 %256, %257
  br i1 %258, label %259, label %268

; <label>:259                                     ; preds = %255
  %260 = load i32* %i, align 4
  %261 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %260
  %262 = load i32* %261, align 4
  %263 = load i32* %j, align 4
  %264 = or i32 %263, %262
  store i32 %264, i32* %j, align 4
  br label %265

; <label>:265                                     ; preds = %259
  %266 = load i32* %i, align 4
  %267 = add nsw i32 %266, -1
  store i32 %267, i32* %i, align 4
  br label %255

; <label>:268                                     ; preds = %255
  %269 = load i32* %j, align 4
  %270 = icmp eq i32 %269, 0
  br i1 %270, label %271, label %337

; <label>:271                                     ; preds = %268
  store i32 1, i32* %k, align 4
  br label %272

; <label>:272                                     ; preds = %280, %271
  %273 = load i32* %jk, align 4
  %274 = load i32* %k, align 4
  %275 = sub nsw i32 %273, %274
  %276 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %275
  %277 = load i32* %276, align 4
  %278 = icmp eq i32 %277, 0
  br i1 %278, label %279, label %283

; <label>:279                                     ; preds = %272
  br label %280

; <label>:280                                     ; preds = %279
  %281 = load i32* %k, align 4
  %282 = add nsw i32 %281, 1
  store i32 %282, i32* %k, align 4
  br label %272

; <label>:283                                     ; preds = %272
  %284 = load i32* %jz, align 4
  %285 = add nsw i32 %284, 1
  store i32 %285, i32* %i, align 4
  br label %286

; <label>:286                                     ; preds = %330, %283
  %287 = load i32* %i, align 4
  %288 = load i32* %jz, align 4
  %289 = load i32* %k, align 4
  %290 = add nsw i32 %288, %289
  %291 = icmp sle i32 %287, %290
  br i1 %291, label %292, label %333

; <label>:292                                     ; preds = %286
  %293 = load i32* %jv, align 4
  %294 = load i32* %i, align 4
  %295 = add nsw i32 %293, %294
  %296 = load i32** %6, align 4
  %297 = getelementptr inbounds i32* %296, i32 %295
  %298 = load i32* %297, align 4
  %299 = sitofp i32 %298 to float
  %300 = load i32* %jx, align 4
  %301 = load i32* %i, align 4
  %302 = add nsw i32 %300, %301
  %303 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %302
  store float %299, float* %303, align 4
  store i32 0, i32* %j, align 4
  store float 0.000000e+00, float* %fw, align 4
  br label %304

; <label>:304                                     ; preds = %323, %292
  %305 = load i32* %j, align 4
  %306 = load i32* %jx, align 4
  %307 = icmp sle i32 %305, %306
  br i1 %307, label %308, label %326

; <label>:308                                     ; preds = %304
  %309 = load i32* %j, align 4
  %310 = load float** %1, align 4
  %311 = getelementptr inbounds float* %310, i32 %309
  %312 = load float* %311, align 4
  %313 = load i32* %jx, align 4
  %314 = load i32* %i, align 4
  %315 = add nsw i32 %313, %314
  %316 = load i32* %j, align 4
  %317 = sub nsw i32 %315, %316
  %318 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %317
  %319 = load float* %318, align 4
  %320 = fmul float %312, %319
  %321 = load float* %fw, align 4
  %322 = fadd float %321, %320
  store float %322, float* %fw, align 4
  br label %323

; <label>:323                                     ; preds = %308
  %324 = load i32* %j, align 4
  %325 = add nsw i32 %324, 1
  store i32 %325, i32* %j, align 4
  br label %304

; <label>:326                                     ; preds = %304
  %327 = load float* %fw, align 4
  %328 = load i32* %i, align 4
  %329 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %328
  store float %327, float* %329, align 4
  br label %330

; <label>:330                                     ; preds = %326
  %331 = load i32* %i, align 4
  %332 = add nsw i32 %331, 1
  store i32 %332, i32* %i, align 4
  br label %286

; <label>:333                                     ; preds = %286
  %334 = load i32* %k, align 4
  %335 = load i32* %jz, align 4
  %336 = add nsw i32 %335, %334
  store i32 %336, i32* %jz, align 4
  br label %91

; <label>:337                                     ; preds = %268
  br label %338

; <label>:338                                     ; preds = %337, %249
  %339 = load float* %z, align 4
  %340 = fcmp oeq float %339, 0.000000e+00
  br i1 %340, label %341, label %357

; <label>:341                                     ; preds = %338
  %342 = load i32* %jz, align 4
  %343 = sub nsw i32 %342, 1
  store i32 %343, i32* %jz, align 4
  %344 = load i32* %q0, align 4
  %345 = sub nsw i32 %344, 8
  store i32 %345, i32* %q0, align 4
  br label %346

; <label>:346                                     ; preds = %351, %341
  %347 = load i32* %jz, align 4
  %348 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %347
  %349 = load i32* %348, align 4
  %350 = icmp eq i32 %349, 0
  br i1 %350, label %351, label %356

; <label>:351                                     ; preds = %346
  %352 = load i32* %jz, align 4
  %353 = add nsw i32 %352, -1
  store i32 %353, i32* %jz, align 4
  %354 = load i32* %q0, align 4
  %355 = sub nsw i32 %354, 8
  store i32 %355, i32* %q0, align 4
  br label %346

; <label>:356                                     ; preds = %346
  br label %390

; <label>:357                                     ; preds = %338
  %358 = load float* %z, align 4
  %359 = load i32* %q0, align 4
  %360 = sub nsw i32 0, %359
  %361 = call float @scalbnf(float %358, i32 %360) #4
  store float %361, float* %z, align 4
  %362 = load float* %z, align 4
  %363 = fcmp oge float %362, 2.560000e+02
  br i1 %363, label %364, label %384

; <label>:364                                     ; preds = %357
  %365 = load float* %z, align 4
  %366 = fmul float 3.906250e-03, %365
  %367 = fptosi float %366 to i32
  %368 = sitofp i32 %367 to float
  store float %368, float* %fw, align 4
  %369 = load float* %z, align 4
  %370 = load float* %fw, align 4
  %371 = fmul float 2.560000e+02, %370
  %372 = fsub float %369, %371
  %373 = fptosi float %372 to i32
  %374 = load i32* %jz, align 4
  %375 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %374
  store i32 %373, i32* %375, align 4
  %376 = load i32* %jz, align 4
  %377 = add nsw i32 %376, 1
  store i32 %377, i32* %jz, align 4
  %378 = load i32* %q0, align 4
  %379 = add nsw i32 %378, 8
  store i32 %379, i32* %q0, align 4
  %380 = load float* %fw, align 4
  %381 = fptosi float %380 to i32
  %382 = load i32* %jz, align 4
  %383 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %382
  store i32 %381, i32* %383, align 4
  br label %389

; <label>:384                                     ; preds = %357
  %385 = load float* %z, align 4
  %386 = fptosi float %385 to i32
  %387 = load i32* %jz, align 4
  %388 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %387
  store i32 %386, i32* %388, align 4
  br label %389

; <label>:389                                     ; preds = %384, %364
  br label %390

; <label>:390                                     ; preds = %389, %356
  %391 = load i32* %q0, align 4
  %392 = call float @scalbnf(float 1.000000e+00, i32 %391) #4
  store float %392, float* %fw, align 4
  %393 = load i32* %jz, align 4
  store i32 %393, i32* %i, align 4
  br label %394

; <label>:394                                     ; preds = %408, %390
  %395 = load i32* %i, align 4
  %396 = icmp sge i32 %395, 0
  br i1 %396, label %397, label %411

; <label>:397                                     ; preds = %394
  %398 = load float* %fw, align 4
  %399 = load i32* %i, align 4
  %400 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %399
  %401 = load i32* %400, align 4
  %402 = sitofp i32 %401 to float
  %403 = fmul float %398, %402
  %404 = load i32* %i, align 4
  %405 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %404
  store float %403, float* %405, align 4
  %406 = load float* %fw, align 4
  %407 = fmul float %406, 3.906250e-03
  store float %407, float* %fw, align 4
  br label %408

; <label>:408                                     ; preds = %397
  %409 = load i32* %i, align 4
  %410 = add nsw i32 %409, -1
  store i32 %410, i32* %i, align 4
  br label %394

; <label>:411                                     ; preds = %394
  %412 = load i32* %jz, align 4
  store i32 %412, i32* %i, align 4
  br label %413

; <label>:413                                     ; preds = %450, %411
  %414 = load i32* %i, align 4
  %415 = icmp sge i32 %414, 0
  br i1 %415, label %416, label %453

; <label>:416                                     ; preds = %413
  store float 0.000000e+00, float* %fw, align 4
  store i32 0, i32* %k, align 4
  br label %417

; <label>:417                                     ; preds = %441, %416
  %418 = load i32* %k, align 4
  %419 = load i32* %jp, align 4
  %420 = icmp sle i32 %418, %419
  br i1 %420, label %421, label %427

; <label>:421                                     ; preds = %417
  %422 = load i32* %k, align 4
  %423 = load i32* %jz, align 4
  %424 = load i32* %i, align 4
  %425 = sub nsw i32 %423, %424
  %426 = icmp sle i32 %422, %425
  br label %427

; <label>:427                                     ; preds = %421, %417
  %428 = phi i1 [ false, %417 ], [ %426, %421 ]
  br i1 %428, label %429, label %444

; <label>:429                                     ; preds = %427
  %430 = load i32* %k, align 4
  %431 = getelementptr inbounds [11 x float]* @PIo2, i32 0, i32 %430
  %432 = load float* %431, align 4
  %433 = load i32* %i, align 4
  %434 = load i32* %k, align 4
  %435 = add nsw i32 %433, %434
  %436 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %435
  %437 = load float* %436, align 4
  %438 = fmul float %432, %437
  %439 = load float* %fw, align 4
  %440 = fadd float %439, %438
  store float %440, float* %fw, align 4
  br label %441

; <label>:441                                     ; preds = %429
  %442 = load i32* %k, align 4
  %443 = add nsw i32 %442, 1
  store i32 %443, i32* %k, align 4
  br label %417

; <label>:444                                     ; preds = %427
  %445 = load float* %fw, align 4
  %446 = load i32* %jz, align 4
  %447 = load i32* %i, align 4
  %448 = sub nsw i32 %446, %447
  %449 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %448
  store float %445, float* %449, align 4
  br label %450

; <label>:450                                     ; preds = %444
  %451 = load i32* %i, align 4
  %452 = add nsw i32 %451, -1
  store i32 %452, i32* %i, align 4
  br label %413

; <label>:453                                     ; preds = %413
  %454 = load i32* %5, align 4
  switch i32 %454, label %643 [
    i32 0, label %455
    i32 1, label %481
    i32 2, label %481
    i32 3, label %536
  ]

; <label>:455                                     ; preds = %453
  store float 0.000000e+00, float* %fw, align 4
  %456 = load i32* %jz, align 4
  store i32 %456, i32* %i, align 4
  br label %457

; <label>:457                                     ; preds = %466, %455
  %458 = load i32* %i, align 4
  %459 = icmp sge i32 %458, 0
  br i1 %459, label %460, label %469

; <label>:460                                     ; preds = %457
  %461 = load i32* %i, align 4
  %462 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %461
  %463 = load float* %462, align 4
  %464 = load float* %fw, align 4
  %465 = fadd float %464, %463
  store float %465, float* %fw, align 4
  br label %466

; <label>:466                                     ; preds = %460
  %467 = load i32* %i, align 4
  %468 = add nsw i32 %467, -1
  store i32 %468, i32* %i, align 4
  br label %457

; <label>:469                                     ; preds = %457
  %470 = load i32* %ih, align 4
  %471 = icmp eq i32 %470, 0
  br i1 %471, label %472, label %474

; <label>:472                                     ; preds = %469
  %473 = load float* %fw, align 4
  br label %477

; <label>:474                                     ; preds = %469
  %475 = load float* %fw, align 4
  %476 = fsub float -0.000000e+00, %475
  br label %477

; <label>:477                                     ; preds = %474, %472
  %478 = phi float [ %473, %472 ], [ %476, %474 ]
  %479 = load float** %2, align 4
  %480 = getelementptr inbounds float* %479, i32 0
  store float %478, float* %480, align 4
  br label %643

; <label>:481                                     ; preds = %453, %453
  store float 0.000000e+00, float* %fw, align 4
  %482 = load i32* %jz, align 4
  store i32 %482, i32* %i, align 4
  br label %483

; <label>:483                                     ; preds = %492, %481
  %484 = load i32* %i, align 4
  %485 = icmp sge i32 %484, 0
  br i1 %485, label %486, label %495

; <label>:486                                     ; preds = %483
  %487 = load i32* %i, align 4
  %488 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %487
  %489 = load float* %488, align 4
  %490 = load float* %fw, align 4
  %491 = fadd float %490, %489
  store float %491, float* %fw, align 4
  br label %492

; <label>:492                                     ; preds = %486
  %493 = load i32* %i, align 4
  %494 = add nsw i32 %493, -1
  store i32 %494, i32* %i, align 4
  br label %483

; <label>:495                                     ; preds = %483
  %496 = load i32* %ih, align 4
  %497 = icmp eq i32 %496, 0
  br i1 %497, label %498, label %500

; <label>:498                                     ; preds = %495
  %499 = load float* %fw, align 4
  br label %503

; <label>:500                                     ; preds = %495
  %501 = load float* %fw, align 4
  %502 = fsub float -0.000000e+00, %501
  br label %503

; <label>:503                                     ; preds = %500, %498
  %504 = phi float [ %499, %498 ], [ %502, %500 ]
  %505 = load float** %2, align 4
  %506 = getelementptr inbounds float* %505, i32 0
  store float %504, float* %506, align 4
  %507 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 0
  %508 = load float* %507, align 4
  %509 = load float* %fw, align 4
  %510 = fsub float %508, %509
  store float %510, float* %fw, align 4
  store i32 1, i32* %i, align 4
  br label %511

; <label>:511                                     ; preds = %521, %503
  %512 = load i32* %i, align 4
  %513 = load i32* %jz, align 4
  %514 = icmp sle i32 %512, %513
  br i1 %514, label %515, label %524

; <label>:515                                     ; preds = %511
  %516 = load i32* %i, align 4
  %517 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %516
  %518 = load float* %517, align 4
  %519 = load float* %fw, align 4
  %520 = fadd float %519, %518
  store float %520, float* %fw, align 4
  br label %521

; <label>:521                                     ; preds = %515
  %522 = load i32* %i, align 4
  %523 = add nsw i32 %522, 1
  store i32 %523, i32* %i, align 4
  br label %511

; <label>:524                                     ; preds = %511
  %525 = load i32* %ih, align 4
  %526 = icmp eq i32 %525, 0
  br i1 %526, label %527, label %529

; <label>:527                                     ; preds = %524
  %528 = load float* %fw, align 4
  br label %532

; <label>:529                                     ; preds = %524
  %530 = load float* %fw, align 4
  %531 = fsub float -0.000000e+00, %530
  br label %532

; <label>:532                                     ; preds = %529, %527
  %533 = phi float [ %528, %527 ], [ %531, %529 ]
  %534 = load float** %2, align 4
  %535 = getelementptr inbounds float* %534, i32 1
  store float %533, float* %535, align 4
  br label %643

; <label>:536                                     ; preds = %453
  %537 = load i32* %jz, align 4
  store i32 %537, i32* %i, align 4
  br label %538

; <label>:538                                     ; preds = %564, %536
  %539 = load i32* %i, align 4
  %540 = icmp sgt i32 %539, 0
  br i1 %540, label %541, label %567

; <label>:541                                     ; preds = %538
  %542 = load i32* %i, align 4
  %543 = sub nsw i32 %542, 1
  %544 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %543
  %545 = load float* %544, align 4
  %546 = load i32* %i, align 4
  %547 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %546
  %548 = load float* %547, align 4
  %549 = fadd float %545, %548
  store float %549, float* %fw, align 4
  %550 = load i32* %i, align 4
  %551 = sub nsw i32 %550, 1
  %552 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %551
  %553 = load float* %552, align 4
  %554 = load float* %fw, align 4
  %555 = fsub float %553, %554
  %556 = load i32* %i, align 4
  %557 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %556
  %558 = load float* %557, align 4
  %559 = fadd float %558, %555
  store float %559, float* %557, align 4
  %560 = load float* %fw, align 4
  %561 = load i32* %i, align 4
  %562 = sub nsw i32 %561, 1
  %563 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %562
  store float %560, float* %563, align 4
  br label %564

; <label>:564                                     ; preds = %541
  %565 = load i32* %i, align 4
  %566 = add nsw i32 %565, -1
  store i32 %566, i32* %i, align 4
  br label %538

; <label>:567                                     ; preds = %538
  %568 = load i32* %jz, align 4
  store i32 %568, i32* %i, align 4
  br label %569

; <label>:569                                     ; preds = %595, %567
  %570 = load i32* %i, align 4
  %571 = icmp sgt i32 %570, 1
  br i1 %571, label %572, label %598

; <label>:572                                     ; preds = %569
  %573 = load i32* %i, align 4
  %574 = sub nsw i32 %573, 1
  %575 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %574
  %576 = load float* %575, align 4
  %577 = load i32* %i, align 4
  %578 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %577
  %579 = load float* %578, align 4
  %580 = fadd float %576, %579
  store float %580, float* %fw, align 4
  %581 = load i32* %i, align 4
  %582 = sub nsw i32 %581, 1
  %583 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %582
  %584 = load float* %583, align 4
  %585 = load float* %fw, align 4
  %586 = fsub float %584, %585
  %587 = load i32* %i, align 4
  %588 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %587
  %589 = load float* %588, align 4
  %590 = fadd float %589, %586
  store float %590, float* %588, align 4
  %591 = load float* %fw, align 4
  %592 = load i32* %i, align 4
  %593 = sub nsw i32 %592, 1
  %594 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %593
  store float %591, float* %594, align 4
  br label %595

; <label>:595                                     ; preds = %572
  %596 = load i32* %i, align 4
  %597 = add nsw i32 %596, -1
  store i32 %597, i32* %i, align 4
  br label %569

; <label>:598                                     ; preds = %569
  store float 0.000000e+00, float* %fw, align 4
  %599 = load i32* %jz, align 4
  store i32 %599, i32* %i, align 4
  br label %600

; <label>:600                                     ; preds = %609, %598
  %601 = load i32* %i, align 4
  %602 = icmp sge i32 %601, 2
  br i1 %602, label %603, label %612

; <label>:603                                     ; preds = %600
  %604 = load i32* %i, align 4
  %605 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %604
  %606 = load float* %605, align 4
  %607 = load float* %fw, align 4
  %608 = fadd float %607, %606
  store float %608, float* %fw, align 4
  br label %609

; <label>:609                                     ; preds = %603
  %610 = load i32* %i, align 4
  %611 = add nsw i32 %610, -1
  store i32 %611, i32* %i, align 4
  br label %600

; <label>:612                                     ; preds = %600
  %613 = load i32* %ih, align 4
  %614 = icmp eq i32 %613, 0
  br i1 %614, label %615, label %627

; <label>:615                                     ; preds = %612
  %616 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 0
  %617 = load float* %616, align 4
  %618 = load float** %2, align 4
  %619 = getelementptr inbounds float* %618, i32 0
  store float %617, float* %619, align 4
  %620 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 1
  %621 = load float* %620, align 4
  %622 = load float** %2, align 4
  %623 = getelementptr inbounds float* %622, i32 1
  store float %621, float* %623, align 4
  %624 = load float* %fw, align 4
  %625 = load float** %2, align 4
  %626 = getelementptr inbounds float* %625, i32 2
  store float %624, float* %626, align 4
  br label %642

; <label>:627                                     ; preds = %612
  %628 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 0
  %629 = load float* %628, align 4
  %630 = fsub float -0.000000e+00, %629
  %631 = load float** %2, align 4
  %632 = getelementptr inbounds float* %631, i32 0
  store float %630, float* %632, align 4
  %633 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 1
  %634 = load float* %633, align 4
  %635 = fsub float -0.000000e+00, %634
  %636 = load float** %2, align 4
  %637 = getelementptr inbounds float* %636, i32 1
  store float %635, float* %637, align 4
  %638 = load float* %fw, align 4
  %639 = fsub float -0.000000e+00, %638
  %640 = load float** %2, align 4
  %641 = getelementptr inbounds float* %640, i32 2
  store float %639, float* %641, align 4
  br label %642

; <label>:642                                     ; preds = %627, %615
  br label %643

; <label>:643                                     ; preds = %642, %532, %477, %453
  %644 = load i32* %n, align 4
  %645 = and i32 %644, 7
  ret i32 %645
}

; Function Attrs: nounwind
define internal float @__kernel_sinf(float %x, float %y, i32 %iy) #3 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %z = alloca float, align 4
  %r = alloca float, align 4
  %v = alloca float, align 4
  %ix = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %2, align 4
  store float %y, float* %3, align 4
  store i32 %iy, i32* %4, align 4
  br label %5

; <label>:5                                       ; preds = %0
  %6 = load float* %2, align 4
  %7 = bitcast %union.ieee_float_shape_type* %gf_u to float*
  store float %6, float* %7, align 4
  %8 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %9 = load i32* %8, align 4
  store i32 %9, i32* %ix, align 4
  br label %10

; <label>:10                                      ; preds = %5
  %11 = load i32* %ix, align 4
  %12 = and i32 %11, 2147483647
  store i32 %12, i32* %ix, align 4
  %13 = load i32* %ix, align 4
  %14 = icmp slt i32 %13, 838860800
  br i1 %14, label %15, label %22

; <label>:15                                      ; preds = %10
  %16 = load float* %2, align 4
  %17 = fptosi float %16 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19                                      ; preds = %15
  %20 = load float* %2, align 4
  store float %20, float* %1
  br label %68

; <label>:21                                      ; preds = %15
  br label %22

; <label>:22                                      ; preds = %21, %10
  %23 = load float* %2, align 4
  %24 = load float* %2, align 4
  %25 = fmul float %23, %24
  store float %25, float* %z, align 4
  %26 = load float* %z, align 4
  %27 = load float* %2, align 4
  %28 = fmul float %26, %27
  store float %28, float* %v, align 4
  %29 = load float* %z, align 4
  %30 = load float* %z, align 4
  %31 = load float* %z, align 4
  %32 = load float* %z, align 4
  %33 = fmul float %32, 0x3DE5D93A60000000
  %34 = fadd float 0xBE5AE5E680000000, %33
  %35 = fmul float %31, %34
  %36 = fadd float 0x3EC71DE360000000, %35
  %37 = fmul float %30, %36
  %38 = fadd float 0xBF2A01A020000000, %37
  %39 = fmul float %29, %38
  %40 = fadd float 0x3F81111120000000, %39
  store float %40, float* %r, align 4
  %41 = load i32* %4, align 4
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %52

; <label>:43                                      ; preds = %22
  %44 = load float* %2, align 4
  %45 = load float* %v, align 4
  %46 = load float* %z, align 4
  %47 = load float* %r, align 4
  %48 = fmul float %46, %47
  %49 = fadd float 0xBFC5555560000000, %48
  %50 = fmul float %45, %49
  %51 = fadd float %44, %50
  store float %51, float* %1
  br label %68

; <label>:52                                      ; preds = %22
  %53 = load float* %2, align 4
  %54 = load float* %z, align 4
  %55 = load float* %3, align 4
  %56 = fmul float 5.000000e-01, %55
  %57 = load float* %v, align 4
  %58 = load float* %r, align 4
  %59 = fmul float %57, %58
  %60 = fsub float %56, %59
  %61 = fmul float %54, %60
  %62 = load float* %3, align 4
  %63 = fsub float %61, %62
  %64 = load float* %v, align 4
  %65 = fmul float %64, 0xBFC5555560000000
  %66 = fsub float %63, %65
  %67 = fsub float %53, %66
  store float %67, float* %1
  br label %68

; <label>:68                                      ; preds = %52, %43, %19
  %69 = load float* %1
  ret float %69
}

; Function Attrs: nounwind readnone
define internal float @fabsf(float %x) #2 {
  %1 = alloca float, align 4
  %ix = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  %sf_u = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %1, align 4
  br label %2

; <label>:2                                       ; preds = %0
  %3 = load float* %1, align 4
  %4 = bitcast %union.ieee_float_shape_type* %gf_u to float*
  store float %3, float* %4, align 4
  %5 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %6 = load i32* %5, align 4
  store i32 %6, i32* %ix, align 4
  br label %7

; <label>:7                                       ; preds = %2
  br label %8

; <label>:8                                       ; preds = %7
  %9 = load i32* %ix, align 4
  %10 = and i32 %9, 2147483647
  %11 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %10, i32* %11, align 4
  %12 = bitcast %union.ieee_float_shape_type* %sf_u to float*
  %13 = load float* %12, align 4
  store float %13, float* %1, align 4
  br label %14

; <label>:14                                      ; preds = %8
  %15 = load float* %1, align 4
  ret float %15
}

; Function Attrs: nounwind readnone
define internal float @floorf(float %x) #2 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %i0 = alloca i32, align 4
  %j0 = alloca i32, align 4
  %i = alloca i32, align 4
  %ix = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  %sf_u = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %2, align 4
  br label %3

; <label>:3                                       ; preds = %0
  %4 = load float* %2, align 4
  %5 = bitcast %union.ieee_float_shape_type* %gf_u to float*
  store float %4, float* %5, align 4
  %6 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %7 = load i32* %6, align 4
  store i32 %7, i32* %i0, align 4
  br label %8

; <label>:8                                       ; preds = %3
  %9 = load i32* %i0, align 4
  %10 = and i32 %9, 2147483647
  store i32 %10, i32* %ix, align 4
  %11 = load i32* %ix, align 4
  %12 = lshr i32 %11, 23
  %13 = sub i32 %12, 127
  store i32 %13, i32* %j0, align 4
  %14 = load i32* %j0, align 4
  %15 = icmp slt i32 %14, 23
  br i1 %15, label %16, label %62

; <label>:16                                      ; preds = %8
  %17 = load i32* %j0, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %34

; <label>:19                                      ; preds = %16
  %20 = load float* %2, align 4
  %21 = fadd float 0x46293E5940000000, %20
  %22 = fcmp ogt float %21, 0.000000e+00
  br i1 %22, label %23, label %33

; <label>:23                                      ; preds = %19
  %24 = load i32* %i0, align 4
  %25 = icmp sge i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23
  store i32 0, i32* %i0, align 4
  br label %32

; <label>:27                                      ; preds = %23
  %28 = load i32* %ix, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %31, label %30

; <label>:30                                      ; preds = %27
  store i32 -1082130432, i32* %i0, align 4
  br label %31

; <label>:31                                      ; preds = %30, %27
  br label %32

; <label>:32                                      ; preds = %31, %26
  br label %33

; <label>:33                                      ; preds = %32, %19
  br label %61

; <label>:34                                      ; preds = %16
  %35 = load i32* %j0, align 4
  %36 = ashr i32 8388607, %35
  store i32 %36, i32* %i, align 4
  %37 = load i32* %i0, align 4
  %38 = load i32* %i, align 4
  %39 = and i32 %37, %38
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %34
  %42 = load float* %2, align 4
  store float %42, float* %1
  br label %79

; <label>:43                                      ; preds = %34
  %44 = load float* %2, align 4
  %45 = fadd float 0x46293E5940000000, %44
  %46 = fcmp ogt float %45, 0.000000e+00
  br i1 %46, label %47, label %60

; <label>:47                                      ; preds = %43
  %48 = load i32* %i0, align 4
  %49 = icmp slt i32 %48, 0
  br i1 %49, label %50, label %55

; <label>:50                                      ; preds = %47
  %51 = load i32* %j0, align 4
  %52 = ashr i32 8388608, %51
  %53 = load i32* %i0, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, i32* %i0, align 4
  br label %55

; <label>:55                                      ; preds = %50, %47
  %56 = load i32* %i, align 4
  %57 = xor i32 %56, -1
  %58 = load i32* %i0, align 4
  %59 = and i32 %58, %57
  store i32 %59, i32* %i0, align 4
  br label %60

; <label>:60                                      ; preds = %55, %43
  br label %61

; <label>:61                                      ; preds = %60, %33
  br label %71

; <label>:62                                      ; preds = %8
  %63 = load i32* %ix, align 4
  %64 = icmp ult i32 %63, 2139095040
  br i1 %64, label %69, label %65

; <label>:65                                      ; preds = %62
  %66 = load float* %2, align 4
  %67 = load float* %2, align 4
  %68 = fadd float %66, %67
  store float %68, float* %1
  br label %79

; <label>:69                                      ; preds = %62
  %70 = load float* %2, align 4
  store float %70, float* %1
  br label %79

; <label>:71                                      ; preds = %61
  br label %72

; <label>:72                                      ; preds = %71
  %73 = load i32* %i0, align 4
  %74 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %73, i32* %74, align 4
  %75 = bitcast %union.ieee_float_shape_type* %sf_u to float*
  %76 = load float* %75, align 4
  store float %76, float* %2, align 4
  br label %77

; <label>:77                                      ; preds = %72
  %78 = load float* %2, align 4
  store float %78, float* %1
  br label %79

; <label>:79                                      ; preds = %77, %69, %65, %41
  %80 = load float* %1
  ret float %80
}

; Function Attrs: nounwind
define internal float @scalbnf(float %x, i32 %n) #3 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %k = alloca i32, align 4
  %ix = alloca i32, align 4
  %hx = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  %gf_u1 = alloca %union.ieee_float_shape_type, align 4
  %sf_u = alloca %union.ieee_float_shape_type, align 4
  %sf_u2 = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %2, align 4
  store i32 %n, i32* %3, align 4
  br label %4

; <label>:4                                       ; preds = %0
  %5 = load float* %2, align 4
  %6 = bitcast %union.ieee_float_shape_type* %gf_u to float*
  store float %5, float* %6, align 4
  %7 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %8 = load i32* %7, align 4
  store i32 %8, i32* %ix, align 4
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load i32* %ix, align 4
  %11 = and i32 %10, 2147483647
  store i32 %11, i32* %hx, align 4
  %12 = load i32* %hx, align 4
  %13 = lshr i32 %12, 23
  store i32 %13, i32* %k, align 4
  %14 = load i32* %hx, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %9
  %17 = load float* %2, align 4
  store float %17, float* %1
  br label %101

; <label>:18                                      ; preds = %9
  %19 = load i32* %hx, align 4
  %20 = icmp ult i32 %19, 2139095040
  br i1 %20, label %25, label %21

; <label>:21                                      ; preds = %18
  %22 = load float* %2, align 4
  %23 = load float* %2, align 4
  %24 = fadd float %22, %23
  store float %24, float* %1
  br label %101

; <label>:25                                      ; preds = %18
  %26 = load i32* %hx, align 4
  %27 = icmp ult i32 %26, 8388608
  br i1 %27, label %28, label %47

; <label>:28                                      ; preds = %25
  %29 = load float* %2, align 4
  %30 = fmul float %29, 0x4180000000000000
  store float %30, float* %2, align 4
  br label %31

; <label>:31                                      ; preds = %28
  %32 = load float* %2, align 4
  %33 = bitcast %union.ieee_float_shape_type* %gf_u1 to float*
  store float %32, float* %33, align 4
  %34 = bitcast %union.ieee_float_shape_type* %gf_u1 to i32*
  %35 = load i32* %34, align 4
  store i32 %35, i32* %ix, align 4
  br label %36

; <label>:36                                      ; preds = %31
  %37 = load i32* %ix, align 4
  %38 = and i32 %37, 2139095040
  %39 = ashr i32 %38, 23
  %40 = sub nsw i32 %39, 25
  store i32 %40, i32* %k, align 4
  %41 = load i32* %3, align 4
  %42 = icmp slt i32 %41, -50000
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %36
  %44 = load float* %2, align 4
  %45 = fmul float 0x39B4484C00000000, %44
  store float %45, float* %1
  br label %101

; <label>:46                                      ; preds = %36
  br label %47

; <label>:47                                      ; preds = %46, %25
  %48 = load i32* %k, align 4
  %49 = load i32* %3, align 4
  %50 = add nsw i32 %48, %49
  store i32 %50, i32* %k, align 4
  %51 = load i32* %k, align 4
  %52 = icmp sgt i32 %51, 254
  br i1 %52, label %53, label %57

; <label>:53                                      ; preds = %47
  %54 = load float* %2, align 4
  %55 = call float @copysignf(float 0x46293E5940000000, float %54) #6
  %56 = fmul float 0x46293E5940000000, %55
  store float %56, float* %1
  br label %101

; <label>:57                                      ; preds = %47
  %58 = load i32* %k, align 4
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %72

; <label>:60                                      ; preds = %57
  br label %61

; <label>:61                                      ; preds = %60
  %62 = load i32* %ix, align 4
  %63 = and i32 %62, -2139095041
  %64 = load i32* %k, align 4
  %65 = shl i32 %64, 23
  %66 = or i32 %63, %65
  %67 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %66, i32* %67, align 4
  %68 = bitcast %union.ieee_float_shape_type* %sf_u to float*
  %69 = load float* %68, align 4
  store float %69, float* %2, align 4
  br label %70

; <label>:70                                      ; preds = %61
  %71 = load float* %2, align 4
  store float %71, float* %1
  br label %101

; <label>:72                                      ; preds = %57
  %73 = load i32* %k, align 4
  %74 = icmp slt i32 %73, -22
  br i1 %74, label %75, label %86

; <label>:75                                      ; preds = %72
  %76 = load i32* %3, align 4
  %77 = icmp sgt i32 %76, 50000
  br i1 %77, label %78, label %82

; <label>:78                                      ; preds = %75
  %79 = load float* %2, align 4
  %80 = call float @copysignf(float 0x46293E5940000000, float %79) #6
  %81 = fmul float 0x46293E5940000000, %80
  store float %81, float* %1
  br label %101

; <label>:82                                      ; preds = %75
  %83 = load float* %2, align 4
  %84 = call float @copysignf(float 0x39B4484C00000000, float %83) #6
  %85 = fmul float 0x39B4484C00000000, %84
  store float %85, float* %1
  br label %101

; <label>:86                                      ; preds = %72
  %87 = load i32* %k, align 4
  %88 = add nsw i32 %87, 25
  store i32 %88, i32* %k, align 4
  br label %89

; <label>:89                                      ; preds = %86
  %90 = load i32* %ix, align 4
  %91 = and i32 %90, -2139095041
  %92 = load i32* %k, align 4
  %93 = shl i32 %92, 23
  %94 = or i32 %91, %93
  %95 = bitcast %union.ieee_float_shape_type* %sf_u2 to i32*
  store i32 %94, i32* %95, align 4
  %96 = bitcast %union.ieee_float_shape_type* %sf_u2 to float*
  %97 = load float* %96, align 4
  store float %97, float* %2, align 4
  br label %98

; <label>:98                                      ; preds = %89
  %99 = load float* %2, align 4
  %100 = fmul float %99, 0x3E60000000000000
  store float %100, float* %1
  br label %101

; <label>:101                                     ; preds = %98, %82, %78, %70, %53, %43, %21, %16
  %102 = load float* %1
  ret float %102
}

; Function Attrs: nounwind
define internal float @sinf(float %x) #3 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %y = alloca [2 x float], align 4
  %z = alloca float, align 4
  %n = alloca i32, align 4
  %ix = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %2, align 4
  store float 0.000000e+00, float* %z, align 4
  br label %3

; <label>:3                                       ; preds = %0
  %4 = load float* %2, align 4
  %5 = bitcast %union.ieee_float_shape_type* %gf_u to float*
  store float %4, float* %5, align 4
  %6 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %7 = load i32* %6, align 4
  store i32 %7, i32* %ix, align 4
  br label %8

; <label>:8                                       ; preds = %3
  %9 = load i32* %ix, align 4
  %10 = and i32 %9, 2147483647
  store i32 %10, i32* %ix, align 4
  %11 = load i32* %ix, align 4
  %12 = icmp sle i32 %11, 1061752792
  br i1 %12, label %13, label %17

; <label>:13                                      ; preds = %8
  %14 = load float* %2, align 4
  %15 = load float* %z, align 4
  %16 = call float @__kernel_sinf(float %14, float %15, i32 0) #5
  store float %16, float* %1
  br label %56

; <label>:17                                      ; preds = %8
  %18 = load i32* %ix, align 4
  %19 = icmp slt i32 %18, 2139095040
  br i1 %19, label %24, label %20

; <label>:20                                      ; preds = %17
  %21 = load float* %2, align 4
  %22 = load float* %2, align 4
  %23 = fsub float %21, %22
  store float %23, float* %1
  br label %56

; <label>:24                                      ; preds = %17
  %25 = load float* %2, align 4
  %26 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %27 = call i32 @__ieee754_rem_pio2f(float %25, float* %26) #5
  store i32 %27, i32* %n, align 4
  %28 = load i32* %n, align 4
  %29 = and i32 %28, 3
  switch i32 %29, label %49 [
    i32 0, label %30
    i32 1, label %36
    i32 2, label %42
  ]

; <label>:30                                      ; preds = %24
  %31 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %32 = load float* %31, align 4
  %33 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %34 = load float* %33, align 4
  %35 = call float @__kernel_sinf(float %32, float %34, i32 1) #5
  store float %35, float* %1
  br label %56

; <label>:36                                      ; preds = %24
  %37 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %38 = load float* %37, align 4
  %39 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %40 = load float* %39, align 4
  %41 = call float @__kernel_cosf(float %38, float %40) #5
  store float %41, float* %1
  br label %56

; <label>:42                                      ; preds = %24
  %43 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %44 = load float* %43, align 4
  %45 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %46 = load float* %45, align 4
  %47 = call float @__kernel_sinf(float %44, float %46, i32 1) #5
  %48 = fsub float -0.000000e+00, %47
  store float %48, float* %1
  br label %56

; <label>:49                                      ; preds = %24
  %50 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %51 = load float* %50, align 4
  %52 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %53 = load float* %52, align 4
  %54 = call float @__kernel_cosf(float %51, float %53) #5
  %55 = fsub float -0.000000e+00, %54
  store float %55, float* %1
  br label %56

; <label>:56                                      ; preds = %49, %42, %36, %30, %20, %13
  %57 = load float* %1
  ret float %57
}

attributes #0 = { noinline nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind }
attributes #5 = { nobuiltin }
attributes #6 = { nobuiltin nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"int", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !6, i64 0}
!6 = metadata !{metadata !"float", metadata !3, i64 0}

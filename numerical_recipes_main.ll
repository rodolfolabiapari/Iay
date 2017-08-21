; ModuleID = 'numerical_recipes_main.bc'
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
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0)) #4
  %2 = icmp slt i32 %ndim, 1
  br i1 %2, label %._crit_edge27, label %.lr.ph31.preheader

.lr.ph31.preheader:                               ; preds = %0
  br label %.lr.ph31

.preheader6:                                      ; preds = %.lr.ph31
  %3 = icmp sgt i32 %ndim, 0
  br i1 %3, label %.lr.ph26, label %._crit_edge27

.lr.ph26:                                         ; preds = %.preheader6
  %4 = sitofp i32 %isign to double
  %5 = fmul double %4, 0x401921FB54442D1C
  br label %8

.lr.ph31:                                         ; preds = %.lr.ph31, %.lr.ph31.preheader
  %indvar36 = phi i32 [ %indvar.next37, %.lr.ph31 ], [ 0, %.lr.ph31.preheader ]
  %ntot.028 = phi i32 [ %7, %.lr.ph31 ], [ 1, %.lr.ph31.preheader ]
  %idim.029 = add i32 %indvar36, 1
  %scevgep39 = getelementptr [4 x i32]* %nn, i32 0, i32 %idim.029
  %6 = load i32* %scevgep39, align 4, !tbaa !1
  %7 = mul i32 %6, %ntot.028
  %indvar.next37 = add i32 %indvar36, 1
  %exitcond38 = icmp eq i32 %indvar.next37, %ndim
  br i1 %exitcond38, label %.preheader6, label %.lr.ph31

; <label>:8                                       ; preds = %._crit_edge23, %.lr.ph26
  %indvar32 = phi i32 [ %indvar.next33, %._crit_edge23 ], [ 0, %.lr.ph26 ]
  %nprev.024 = phi i32 [ %11, %._crit_edge23 ], [ 1, %.lr.ph26 ]
  %9 = sub i32 %ndim, %indvar32
  %scevgep35 = getelementptr [4 x i32]* %nn, i32 0, i32 %9
  %10 = load i32* %scevgep35, align 4, !tbaa !1
  %11 = mul i32 %10, %nprev.024
  %12 = udiv i32 %7, %11
  %13 = shl i32 %nprev.024, 1
  %14 = mul i32 %10, %13
  %15 = mul i32 %14, %12
  %16 = icmp eq i32 %14, 0
  br i1 %16, label %.preheader5, label %.lr.ph12

.lr.ph12:                                         ; preds = %8
  %17 = add i32 %13, -2
  %18 = shl i32 %nprev.024, 1
  %19 = mul i32 %18, %10
  %20 = shl i32 %nprev.024, 1
  %21 = shl i32 %nprev.024, 1
  %22 = mul i32 %21, %10
  %23 = or i32 %22, 1
  %24 = or i32 %21, 1
  br label %29

.preheader5.loopexit:                             ; preds = %60
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %8
  %25 = icmp ult i32 %13, %14
  br i1 %25, label %.lr.ph22.preheader, label %._crit_edge23

.lr.ph22.preheader:                               ; preds = %.preheader5
  %26 = shl i32 %nprev.024, 1
  %27 = or i32 %26, 1
  %28 = add i32 %26, -1
  br label %.lr.ph22

; <label>:29                                      ; preds = %60, %.lr.ph12
  %indvar3 = phi i32 [ %indvar.next4, %60 ], [ 0, %.lr.ph12 ]
  %i2rev.09 = phi i32 [ %61, %60 ], [ 1, %.lr.ph12 ]
  %30 = mul i32 %20, %indvar3
  %31 = add i32 %30, 3
  %32 = add i32 %23, %30
  %33 = add i32 %30, 2
  %i2.0101 = or i32 %30, 1
  %34 = add i32 %24, %30
  %35 = icmp ugt i32 %i2rev.09, %i2.0101
  br i1 %35, label %.preheader4, label %.preheader3.preheader

.preheader4:                                      ; preds = %29
  %overflow_intrinsic = zext i32 %17 to i33
  %overflow_intrinsic1 = zext i32 %i2.0101 to i33
  %overflow_intrinsic2 = add nuw i33 %overflow_intrinsic, %overflow_intrinsic1
  %overflow_intrinsic_sum = trunc i33 %overflow_intrinsic2 to i32
  %overflow_intrinsic_carry = icmp slt i33 %overflow_intrinsic2, 0
  br i1 %overflow_intrinsic_carry, label %.preheader3.preheader, label %.preheader2.lr.ph

.preheader2.lr.ph:                                ; preds = %.preheader4
  %36 = add i32 %i2rev.09, 1
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge, %.preheader2.lr.ph
  %indvar1 = phi i32 [ %indvar.next2, %._crit_edge ], [ 0, %.preheader2.lr.ph ]
  %37 = shl i32 %indvar1, 1
  %38 = add i32 %31, %37
  %39 = add i32 %32, %37
  %40 = add i32 %33, %37
  %i1.08 = add i32 %i2.0101, %37
  %41 = shl i32 %indvar1, 1
  %42 = add i32 %i2rev.09, %41
  %43 = add i32 %36, %41
  %44 = icmp ugt i32 %i1.08, %15
  br i1 %44, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvar = phi i32 [ %indvar.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %45 = mul i32 %22, %indvar
  %46 = add i32 %39, %45
  %47 = add i32 %40, %45
  %scevgep = getelementptr [134 x float]* %data, i32 0, i32 %47
  %48 = add i32 %i1.08, %45
  %scevgep5 = getelementptr [134 x float]* %data, i32 0, i32 %48
  %49 = mul i32 %19, %indvar
  %50 = add i32 %42, %49
  %scevgep7 = getelementptr [134 x float]* %data, i32 0, i32 %50
  %51 = add i32 %43, %49
  %scevgep6 = getelementptr [134 x float]* %data, i32 0, i32 %51
  %52 = load float* %scevgep5, align 4, !tbaa !5
  %53 = load float* %scevgep7, align 4, !tbaa !5
  store float %53, float* %scevgep5, align 4, !tbaa !5
  store float %52, float* %scevgep7, align 4, !tbaa !5
  %54 = load float* %scevgep, align 4, !tbaa !5
  %55 = load float* %scevgep6, align 4, !tbaa !5
  store float %55, float* %scevgep, align 4, !tbaa !5
  store float %54, float* %scevgep6, align 4, !tbaa !5
  %56 = icmp ugt i32 %46, %15
  %indvar.next = add i32 %indvar, 1
  br i1 %56, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader2
  %57 = icmp ugt i32 %38, %overflow_intrinsic_sum
  %indvar.next2 = add i32 %indvar1, 1
  br i1 %57, label %.preheader3.preheader.loopexit, label %.preheader2

.preheader3.preheader.loopexit:                   ; preds = %._crit_edge
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.loopexit, %.preheader4, %29
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3, %.preheader3.preheader
  %ibit.0.in = phi i32 [ %ibit.0, %.preheader3 ], [ %14, %.preheader3.preheader ]
  %i2rev.1 = phi i32 [ %59, %.preheader3 ], [ %i2rev.09, %.preheader3.preheader ]
  %ibit.0 = lshr i32 %ibit.0.in, 1
  %58 = icmp ugt i32 %i2rev.1, %ibit.0
  %not. = icmp uge i32 %ibit.0, %13
  %. = and i1 %58, %not.
  %59 = sub i32 %i2rev.1, %ibit.0
  br i1 %., label %.preheader3, label %60

; <label>:60                                      ; preds = %.preheader3
  %61 = add i32 %i2rev.1, %ibit.0
  %62 = icmp ugt i32 %34, %14
  %indvar.next4 = add i32 %indvar3, 1
  br i1 %62, label %.preheader5.loopexit, label %29

.loopexit.loopexit:                               ; preds = %._crit_edge17
  br label %.loopexit

.loopexit:                                        ; preds = %.lr.ph22, %.loopexit.loopexit
  %63 = icmp ult i32 %64, %14
  br i1 %63, label %.lr.ph22, label %._crit_edge23.loopexit

.lr.ph22:                                         ; preds = %.loopexit, %.lr.ph22.preheader
  %ifp1.021 = phi i32 [ %64, %.loopexit ], [ %13, %.lr.ph22.preheader ]
  %64 = shl i32 %ifp1.021, 1
  %65 = udiv i32 %64, %13
  %66 = uitofp i32 %65 to double
  %67 = fdiv double %5, %66
  %68 = fptrunc double %67 to float
  %69 = fmul float %68, 5.000000e-01
  %70 = tail call float @sinf(float %69) #4
  %71 = fpext float %70 to double
  %72 = fmul double %71, -2.000000e+00
  %73 = fmul double %71, %72
  %74 = fptrunc double %73 to float
  %75 = tail call float @sinf(float %68) #4
  %76 = icmp eq i32 %ifp1.021, 0
  br i1 %76, label %.loopexit, label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.lr.ph22
  %77 = add i32 %ifp1.021, 2
  %78 = or i32 %ifp1.021, 1
  %79 = shl i32 %ifp1.021, 1
  %80 = or i32 %79, 1
  br label %.preheader1

.preheader1:                                      ; preds = %._crit_edge17, %.preheader1.preheader
  %indvar18 = phi i32 [ %indvar.next19, %._crit_edge17 ], [ 0, %.preheader1.preheader ]
  %wr.020 = phi float [ %124, %._crit_edge17 ], [ 1.000000e+00, %.preheader1.preheader ]
  %wi.019 = phi float [ %128, %._crit_edge17 ], [ 0.000000e+00, %.preheader1.preheader ]
  %81 = mul i32 %26, %indvar18
  %82 = add i32 %81, 3
  %83 = add i32 %80, %81
  %84 = add i32 %81, 2
  %i3.1182 = or i32 %81, 1
  %85 = add i32 %77, %81
  %86 = add i32 %78, %81
  %87 = add i32 %27, %81
  %88 = add i32 %28, %81
  %89 = icmp ugt i32 %i3.1182, %88
  br i1 %89, label %._crit_edge17, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader1
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge15, %.preheader.preheader
  %indvar16 = phi i32 [ %indvar.next17, %._crit_edge15 ], [ 0, %.preheader.preheader ]
  %90 = shl i32 %indvar16, 1
  %91 = add i32 %82, %90
  %92 = add i32 %83, %90
  %93 = add i32 %84, %90
  %i1.116 = add i32 %i3.1182, %90
  %94 = add i32 %85, %90
  %95 = add i32 %86, %90
  %96 = icmp ugt i32 %i1.116, %15
  br i1 %96, label %._crit_edge15, label %.lr.ph14.preheader

.lr.ph14.preheader:                               ; preds = %.preheader
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14, %.lr.ph14.preheader
  %indvar14 = phi i32 [ %indvar.next15, %.lr.ph14 ], [ 0, %.lr.ph14.preheader ]
  %97 = mul i32 %79, %indvar14
  %98 = add i32 %92, %97
  %99 = add i32 %93, %97
  %scevgep20 = getelementptr [134 x float]* %data, i32 0, i32 %99
  %100 = add i32 %i1.116, %97
  %scevgep21 = getelementptr [134 x float]* %data, i32 0, i32 %100
  %101 = add i32 %94, %97
  %scevgep22 = getelementptr [134 x float]* %data, i32 0, i32 %101
  %102 = add i32 %95, %97
  %scevgep23 = getelementptr [134 x float]* %data, i32 0, i32 %102
  %103 = load float* %scevgep23, align 4, !tbaa !5
  %104 = fmul float %wr.020, %103
  %105 = load float* %scevgep22, align 4, !tbaa !5
  %106 = fmul float %wi.019, %105
  %107 = fsub float %104, %106
  %108 = fmul float %wr.020, %105
  %109 = fmul float %wi.019, %103
  %110 = fadd float %109, %108
  %111 = load float* %scevgep21, align 4, !tbaa !5
  %112 = fsub float %111, %107
  store float %112, float* %scevgep23, align 4, !tbaa !5
  %113 = load float* %scevgep20, align 4, !tbaa !5
  %114 = fsub float %113, %110
  store float %114, float* %scevgep22, align 4, !tbaa !5
  %115 = load float* %scevgep21, align 4, !tbaa !5
  %116 = fadd float %107, %115
  store float %116, float* %scevgep21, align 4, !tbaa !5
  %117 = load float* %scevgep20, align 4, !tbaa !5
  %118 = fadd float %110, %117
  store float %118, float* %scevgep20, align 4, !tbaa !5
  %119 = icmp ugt i32 %98, %15
  %indvar.next15 = add i32 %indvar14, 1
  br i1 %119, label %._crit_edge15.loopexit, label %.lr.ph14

._crit_edge15.loopexit:                           ; preds = %.lr.ph14
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader
  %120 = icmp ugt i32 %91, %88
  %indvar.next17 = add i32 %indvar16, 1
  br i1 %120, label %._crit_edge17.loopexit, label %.preheader

._crit_edge17.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader1
  %121 = fmul float %74, %wr.020
  %122 = fmul float %75, %wi.019
  %123 = fsub float %121, %122
  %124 = fadd float %wr.020, %123
  %125 = fmul float %74, %wi.019
  %126 = fmul float %75, %wr.020
  %127 = fadd float %125, %126
  %128 = fadd float %wi.019, %127
  %129 = icmp ugt i32 %87, %ifp1.021
  %indvar.next19 = add i32 %indvar18, 1
  br i1 %129, label %.loopexit.loopexit, label %.preheader1

._crit_edge23.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader5
  %indvar.next33 = add i32 %indvar32, 1
  %exitcond34 = icmp eq i32 %indvar.next33, %ndim
  br i1 %exitcond34, label %._crit_edge27.loopexit, label %8

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
  %indvar = phi i32 [ %indvar.next, %.preheader.us ], [ 0, %.preheader.us.preheader ]
  %indvar.next = add i32 %indvar, 1
  %exitcond1 = icmp eq i32 %indvar.next, %height
  br i1 %exitcond1, label %._crit_edge4.loopexit, label %.preheader.us

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvar5 = phi i32 [ %indvar.next6, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %row_pos.02 = add i32 %indvar5, 1
  %4 = sitofp i32 %row_pos.02 to float
  br label %5

; <label>:5                                       ; preds = %5, %.lr.ph
  %indvar2 = phi i32 [ %indvar.next3, %5 ], [ 0, %.lr.ph ]
  %6 = add i32 %indvar2, 1
  %scevgep = getelementptr [1 x [512 x [512 x float]]]* @data, i32 1, i32 0, i32 %row_pos.02, i32 %6
  %col_pos.01 = add i32 %indvar2, 1
  %7 = sitofp i32 %col_pos.01 to float
  %8 = fmul float %4, %7
  store float %8, float* %scevgep, align 4, !tbaa !5
  %indvar.next3 = add i32 %indvar2, 1
  %exitcond4 = icmp eq i32 %indvar.next3, %width
  br i1 %exitcond4, label %._crit_edge, label %5

._crit_edge:                                      ; preds = %5
  %indvar.next6 = add i32 %indvar5, 1
  %exitcond = icmp eq i32 %indvar.next6, %height
  br i1 %exitcond, label %._crit_edge4.loopexit8, label %.lr.ph

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
  %6 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u, i32 0, i32 0
  store float %5, float* %6, align 4
  %7 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %8 = load i32* %7, align 4
  store i32 %8, i32* %hx, align 4
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load i32* %hx, align 4
  %11 = and i32 %10, 2147483647
  store i32 %11, i32* %ix, align 4
  %12 = icmp ult i32 %11, 1061752793
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %9
  %14 = load float* %2, align 4
  %15 = load float** %3, align 4
  store float %14, float* %15, align 4
  %16 = load float** %3, align 4
  %17 = getelementptr inbounds float* %16, i32 1
  store float 0.000000e+00, float* %17, align 4
  store i32 0, i32* %1, align 4
  br label %264

; <label>:18                                      ; preds = %9
  %19 = load i32* %ix, align 4
  %20 = icmp slt i32 %19, 1075235812
  br i1 %20, label %21, label %80

; <label>:21                                      ; preds = %18
  %22 = load i32* %hx, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %52

; <label>:24                                      ; preds = %21
  %25 = load float* %2, align 4
  %26 = fadd float %25, 0xBFF921F000000000
  store float %26, float* %z, align 4
  %27 = load i32* %ix, align 4
  %28 = and i32 %27, -16
  %29 = icmp eq i32 %28, 1070141392
  br i1 %29, label %40, label %30

; <label>:30                                      ; preds = %24
  %31 = load float* %z, align 4
  %32 = fadd float %31, 0xBEE6A88860000000
  %33 = load float** %3, align 4
  store float %32, float* %33, align 4
  %34 = load float* %z, align 4
  %35 = load float** %3, align 4
  %36 = load float* %35, align 4
  %37 = fsub float %34, %36
  %38 = fadd float %37, 0xBEE6A88860000000
  %39 = getelementptr inbounds float* %35, i32 1
  store float %38, float* %39, align 4
  br label %51

; <label>:40                                      ; preds = %24
  %41 = load float* %z, align 4
  %42 = fadd float %41, 0xBEE6A88000000000
  store float %42, float* %z, align 4
  %43 = fadd float %42, 0xBDD0B46100000000
  %44 = load float** %3, align 4
  store float %43, float* %44, align 4
  %45 = load float* %z, align 4
  %46 = load float** %3, align 4
  %47 = load float* %46, align 4
  %48 = fsub float %45, %47
  %49 = fadd float %48, 0xBDD0B46100000000
  %50 = getelementptr inbounds float* %46, i32 1
  store float %49, float* %50, align 4
  br label %51

; <label>:51                                      ; preds = %40, %30
  store i32 1, i32* %1, align 4
  br label %264

; <label>:52                                      ; preds = %21
  %53 = load float* %2, align 4
  %54 = fadd float %53, 0x3FF921F000000000
  store float %54, float* %z, align 4
  %55 = load i32* %ix, align 4
  %56 = and i32 %55, -16
  %57 = icmp eq i32 %56, 1070141392
  br i1 %57, label %68, label %58

; <label>:58                                      ; preds = %52
  %59 = load float* %z, align 4
  %60 = fadd float %59, 0x3EE6A88860000000
  %61 = load float** %3, align 4
  store float %60, float* %61, align 4
  %62 = load float* %z, align 4
  %63 = load float** %3, align 4
  %64 = load float* %63, align 4
  %65 = fsub float %62, %64
  %66 = fadd float %65, 0x3EE6A88860000000
  %67 = getelementptr inbounds float* %63, i32 1
  store float %66, float* %67, align 4
  br label %79

; <label>:68                                      ; preds = %52
  %69 = load float* %z, align 4
  %70 = fadd float %69, 0x3EE6A88000000000
  store float %70, float* %z, align 4
  %71 = fadd float %70, 0x3DD0B46100000000
  %72 = load float** %3, align 4
  store float %71, float* %72, align 4
  %73 = load float* %z, align 4
  %74 = load float** %3, align 4
  %75 = load float* %74, align 4
  %76 = fsub float %73, %75
  %77 = fadd float %76, 0x3DD0B46100000000
  %78 = getelementptr inbounds float* %74, i32 1
  store float %77, float* %78, align 4
  br label %79

; <label>:79                                      ; preds = %68, %58
  store i32 -1, i32* %1, align 4
  br label %264

; <label>:80                                      ; preds = %18
  %81 = load i32* %ix, align 4
  %82 = icmp slt i32 %81, 1128861569
  br i1 %82, label %83, label %193

; <label>:83                                      ; preds = %80
  %84 = load float* %2, align 4
  %85 = call float @fabsf(float %84) #6
  store float %85, float* %t, align 4
  %86 = fmul float %85, 0x3FE45F3080000000
  %87 = fadd float %86, 5.000000e-01
  %88 = fptosi float %87 to i32
  store i32 %88, i32* %n, align 4
  %89 = sitofp i32 %88 to float
  store float %89, float* %fn, align 4
  %90 = load float* %t, align 4
  %91 = fmul float %89, 0x3FF921F000000000
  %92 = fsub float %90, %91
  store float %92, float* %r, align 4
  %93 = fmul float %89, 0x3EE6A88860000000
  store float %93, float* %w, align 4
  %94 = load i32* %n, align 4
  %95 = icmp slt i32 %94, 32
  br i1 %95, label %96, label %109

; <label>:96                                      ; preds = %83
  %97 = load i32* %ix, align 4
  %98 = and i32 %97, -256
  %99 = load i32* %n, align 4
  %100 = add nsw i32 %99, -1
  %101 = getelementptr inbounds [32 x i32]* @npio2_hw, i32 0, i32 %100
  %102 = load i32* %101, align 4
  %103 = icmp eq i32 %98, %102
  br i1 %103, label %109, label %104

; <label>:104                                     ; preds = %96
  %105 = load float* %r, align 4
  %106 = load float* %w, align 4
  %107 = fsub float %105, %106
  %108 = load float** %3, align 4
  store float %107, float* %108, align 4
  br label %170

; <label>:109                                     ; preds = %96, %83
  %110 = load i32* %ix, align 4
  %111 = ashr i32 %110, 23
  store i32 %111, i32* %j, align 4
  %112 = load float* %r, align 4
  %113 = load float* %w, align 4
  %114 = fsub float %112, %113
  %115 = load float** %3, align 4
  store float %114, float* %115, align 4
  br label %116

; <label>:116                                     ; preds = %109
  %117 = load float** %3, align 4
  %118 = load float* %117, align 4
  %119 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u1, i32 0, i32 0
  store float %118, float* %119, align 4
  %120 = bitcast %union.ieee_float_shape_type* %gf_u1 to i32*
  %121 = load i32* %120, align 4
  store i32 %121, i32* %high, align 4
  br label %122

; <label>:122                                     ; preds = %116
  %123 = load i32* %j, align 4
  %124 = load i32* %high, align 4
  %125 = lshr i32 %124, 23
  %126 = and i32 %125, 255
  %127 = sub i32 %123, %126
  store i32 %127, i32* %i, align 4
  %128 = icmp sgt i32 %127, 8
  br i1 %128, label %129, label %169

; <label>:129                                     ; preds = %122
  %130 = load float* %r, align 4
  store float %130, float* %t, align 4
  %131 = load float* %fn, align 4
  %132 = fmul float %131, 0x3EE6A88000000000
  store float %132, float* %w, align 4
  %133 = fsub float %130, %132
  store float %133, float* %r, align 4
  %134 = fmul float %131, 0x3DD0B46100000000
  %135 = load float* %t, align 4
  %136 = fsub float %135, %133
  %137 = fsub float %136, %132
  %138 = fsub float %134, %137
  store float %138, float* %w, align 4
  %139 = load float* %r, align 4
  %140 = fsub float %139, %138
  %141 = load float** %3, align 4
  store float %140, float* %141, align 4
  br label %142

; <label>:142                                     ; preds = %129
  %143 = load float** %3, align 4
  %144 = load float* %143, align 4
  %145 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u2, i32 0, i32 0
  store float %144, float* %145, align 4
  %146 = bitcast %union.ieee_float_shape_type* %gf_u2 to i32*
  %147 = load i32* %146, align 4
  store i32 %147, i32* %high, align 4
  br label %148

; <label>:148                                     ; preds = %142
  %149 = load i32* %j, align 4
  %150 = load i32* %high, align 4
  %151 = lshr i32 %150, 23
  %152 = and i32 %151, 255
  %153 = sub i32 %149, %152
  store i32 %153, i32* %i, align 4
  %154 = icmp sgt i32 %153, 25
  br i1 %154, label %155, label %168

; <label>:155                                     ; preds = %148
  %156 = load float* %r, align 4
  store float %156, float* %t, align 4
  %157 = load float* %fn, align 4
  %158 = fmul float %157, 0x3DD0B46000000000
  store float %158, float* %w, align 4
  %159 = fsub float %156, %158
  store float %159, float* %r, align 4
  %160 = fmul float %157, 0x3C91A62640000000
  %161 = load float* %t, align 4
  %162 = fsub float %161, %159
  %163 = fsub float %162, %158
  %164 = fsub float %160, %163
  store float %164, float* %w, align 4
  %165 = load float* %r, align 4
  %166 = fsub float %165, %164
  %167 = load float** %3, align 4
  store float %166, float* %167, align 4
  br label %168

; <label>:168                                     ; preds = %155, %148
  br label %169

; <label>:169                                     ; preds = %168, %122
  br label %170

; <label>:170                                     ; preds = %169, %104
  %171 = load float* %r, align 4
  %172 = load float** %3, align 4
  %173 = load float* %172, align 4
  %174 = fsub float %171, %173
  %175 = load float* %w, align 4
  %176 = fsub float %174, %175
  %177 = getelementptr inbounds float* %172, i32 1
  store float %176, float* %177, align 4
  %178 = load i32* %hx, align 4
  %179 = icmp slt i32 %178, 0
  br i1 %179, label %180, label %191

; <label>:180                                     ; preds = %170
  %181 = load float** %3, align 4
  %182 = load float* %181, align 4
  %183 = fsub float -0.000000e+00, %182
  store float %183, float* %181, align 4
  %184 = load float** %3, align 4
  %185 = getelementptr inbounds float* %184, i32 1
  %186 = load float* %185, align 4
  %187 = fsub float -0.000000e+00, %186
  %188 = getelementptr inbounds float* %184, i32 1
  store float %187, float* %188, align 4
  %189 = load i32* %n, align 4
  %190 = sub nsw i32 0, %189
  store i32 %190, i32* %1, align 4
  br label %264

; <label>:191                                     ; preds = %170
  %192 = load i32* %n, align 4
  store i32 %192, i32* %1, align 4
  br label %264

; <label>:193                                     ; preds = %80
  %194 = load i32* %ix, align 4
  %195 = icmp slt i32 %194, 2139095040
  br i1 %195, label %202, label %196

; <label>:196                                     ; preds = %193
  %197 = load float* %2, align 4
  %198 = fsub float %197, %197
  %199 = load float** %3, align 4
  %200 = getelementptr inbounds float* %199, i32 1
  store float %198, float* %200, align 4
  %201 = load float** %3, align 4
  store float %198, float* %201, align 4
  store i32 0, i32* %1, align 4
  br label %264

; <label>:202                                     ; preds = %193
  %203 = load i32* %ix, align 4
  %204 = ashr i32 %203, 23
  %205 = add nsw i32 %204, -134
  store i32 %205, i32* %e0, align 4
  br label %206

; <label>:206                                     ; preds = %202
  %207 = load i32* %ix, align 4
  %208 = load i32* %e0, align 4
  %209 = shl i32 %208, 23
  %210 = sub nsw i32 %207, %209
  %211 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %210, i32* %211, align 4
  %212 = getelementptr inbounds %union.ieee_float_shape_type* %sf_u, i32 0, i32 0
  %213 = load float* %212, align 4
  store float %213, float* %z, align 4
  br label %214

; <label>:214                                     ; preds = %206
  br label %215

; <label>:215                                     ; preds = %229, %214
  %storemerge = phi i32 [ 0, %214 ], [ %231, %229 ]
  store i32 %storemerge, i32* %i, align 4
  %216 = icmp slt i32 %storemerge, 2
  br i1 %216, label %217, label %232

; <label>:217                                     ; preds = %215
  %218 = load float* %z, align 4
  %219 = fptosi float %218 to i32
  %220 = sitofp i32 %219 to float
  %221 = load i32* %i, align 4
  %222 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 %221
  store float %220, float* %222, align 4
  %223 = load float* %z, align 4
  %224 = load i32* %i, align 4
  %225 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 %224
  %226 = load float* %225, align 4
  %227 = fsub float %223, %226
  %228 = fmul float %227, 2.560000e+02
  store float %228, float* %z, align 4
  br label %229

; <label>:229                                     ; preds = %217
  %230 = load i32* %i, align 4
  %231 = add nsw i32 %230, 1
  br label %215

; <label>:232                                     ; preds = %215
  %233 = load float* %z, align 4
  %234 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 2
  store float %233, float* %234, align 4
  br label %235

; <label>:235                                     ; preds = %240, %232
  %storemerge1 = phi i32 [ 3, %232 ], [ %242, %240 ]
  store i32 %storemerge1, i32* %nx, align 4
  %236 = add nsw i32 %storemerge1, -1
  %237 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 %236
  %238 = load float* %237, align 4
  %239 = fcmp oeq float %238, 0.000000e+00
  br i1 %239, label %240, label %243

; <label>:240                                     ; preds = %235
  %241 = load i32* %nx, align 4
  %242 = add nsw i32 %241, -1
  br label %235

; <label>:243                                     ; preds = %235
  %244 = getelementptr inbounds [3 x float]* %tx, i32 0, i32 0
  %245 = load float** %3, align 4
  %246 = load i32* %e0, align 4
  %247 = load i32* %nx, align 4
  %248 = call i32 @__kernel_rem_pio2f(float* %244, float* %245, i32 %246, i32 %247, i32 2, i32* getelementptr inbounds ([198 x i32]* @two_over_pi, i32 0, i32 0)) #5
  store i32 %248, i32* %n, align 4
  %249 = load i32* %hx, align 4
  %250 = icmp slt i32 %249, 0
  br i1 %250, label %251, label %262

; <label>:251                                     ; preds = %243
  %252 = load float** %3, align 4
  %253 = load float* %252, align 4
  %254 = fsub float -0.000000e+00, %253
  store float %254, float* %252, align 4
  %255 = load float** %3, align 4
  %256 = getelementptr inbounds float* %255, i32 1
  %257 = load float* %256, align 4
  %258 = fsub float -0.000000e+00, %257
  %259 = getelementptr inbounds float* %255, i32 1
  store float %258, float* %259, align 4
  %260 = load i32* %n, align 4
  %261 = sub nsw i32 0, %260
  store i32 %261, i32* %1, align 4
  br label %264

; <label>:262                                     ; preds = %243
  %263 = load i32* %n, align 4
  store i32 %263, i32* %1, align 4
  br label %264

; <label>:264                                     ; preds = %262, %251, %196, %191, %180, %79, %51, %13
  %265 = load i32* %1, align 4
  ret i32 %265
}

; Function Attrs: nounwind
define internal float @__kernel_cosf(float %x, float %y) #3 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
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
  %6 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u, i32 0, i32 0
  store float %5, float* %6, align 4
  %7 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %8 = load i32* %7, align 4
  store i32 %8, i32* %ix, align 4
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load i32* %ix, align 4
  %11 = and i32 %10, 2147483647
  store i32 %11, i32* %ix, align 4
  %12 = icmp ult i32 %11, 838860800
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %9
  %14 = load float* %2, align 4
  %15 = fptosi float %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %13
  store float 1.000000e+00, float* %1, align 4
  br label %72

; <label>:18                                      ; preds = %13
  br label %19

; <label>:19                                      ; preds = %18, %9
  %20 = load float* %2, align 4
  %21 = fmul float %20, %20
  store float %21, float* %z, align 4
  %22 = fmul float %21, 0xBDA8FAE9C0000000
  %23 = fadd float %22, 0x3E21EE9EC0000000
  %24 = fmul float %21, %23
  %25 = fadd float %24, 0xBE927E4F80000000
  %26 = fmul float %21, %25
  %27 = fadd float %26, 0x3EFA01A020000000
  %28 = fmul float %21, %27
  %29 = fadd float %28, 0xBF56C16C20000000
  %30 = fmul float %21, %29
  %31 = fadd float %30, 0x3FA5555560000000
  %32 = fmul float %21, %31
  store float %32, float* %r, align 4
  %33 = load i32* %ix, align 4
  %34 = icmp slt i32 %33, 1050253722
  br i1 %34, label %35, label %46

; <label>:35                                      ; preds = %19
  %36 = load float* %z, align 4
  %37 = fmul float %36, 5.000000e-01
  %38 = load float* %r, align 4
  %39 = fmul float %36, %38
  %40 = load float* %2, align 4
  %41 = load float* %3, align 4
  %42 = fmul float %40, %41
  %43 = fsub float %39, %42
  %44 = fsub float %37, %43
  %45 = fsub float 1.000000e+00, %44
  store float %45, float* %1, align 4
  br label %72

; <label>:46                                      ; preds = %19
  %47 = load i32* %ix, align 4
  %48 = icmp sgt i32 %47, 1061683200
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %46
  store float 2.812500e-01, float* %qx, align 4
  br label %58

; <label>:50                                      ; preds = %46
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* %ix, align 4
  %53 = add nsw i32 %52, -16777216
  %54 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %53, i32* %54, align 4
  %55 = getelementptr inbounds %union.ieee_float_shape_type* %sf_u, i32 0, i32 0
  %56 = load float* %55, align 4
  store float %56, float* %qx, align 4
  br label %57

; <label>:57                                      ; preds = %51
  br label %58

; <label>:58                                      ; preds = %57, %49
  %59 = load float* %z, align 4
  %60 = fmul float %59, 5.000000e-01
  %61 = load float* %qx, align 4
  %62 = fsub float %60, %61
  %63 = fsub float 1.000000e+00, %61
  %64 = load float* %r, align 4
  %65 = fmul float %59, %64
  %66 = load float* %2, align 4
  %67 = load float* %3, align 4
  %68 = fmul float %66, %67
  %69 = fsub float %65, %68
  %70 = fsub float %62, %69
  %71 = fsub float %63, %70
  store float %71, float* %1, align 4
  br label %72

; <label>:72                                      ; preds = %58, %35, %17
  %73 = load float* %1, align 4
  ret float %73
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
  %7 = getelementptr inbounds [3 x i32]* @init_jk, i32 0, i32 %prec
  %8 = load i32* %7, align 4
  store i32 %8, i32* %jk, align 4
  store i32 %8, i32* %jp, align 4
  %9 = load i32* %4, align 4
  %10 = add nsw i32 %9, -1
  store i32 %10, i32* %jx, align 4
  %11 = load i32* %3, align 4
  %12 = add nsw i32 %11, -3
  %13 = sdiv i32 %12, 8
  %14 = icmp slt i32 %12, -7
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %15, %0
  %storemerge16 = phi i32 [ 0, %15 ], [ %13, %0 ]
  store i32 %storemerge16, i32* %jv, align 4
  %17 = load i32* %3, align 4
  %18 = shl i32 %storemerge16, 3
  %19 = add i32 %18, 8
  %20 = sub nsw i32 %17, %19
  store i32 %20, i32* %q0, align 4
  %21 = load i32* %jx, align 4
  %22 = sub nsw i32 %storemerge16, %21
  store i32 %22, i32* %j, align 4
  %23 = load i32* %jk, align 4
  %24 = add nsw i32 %21, %23
  store i32 %24, i32* %m, align 4
  store i32 0, i32* %i, align 4
  br label %25

; <label>:25                                      ; preds = %43, %16
  %26 = load i32* %i, align 4
  %27 = load i32* %m, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %48, label %29

; <label>:29                                      ; preds = %25
  %30 = load i32* %j, align 4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  br label %39

; <label>:33                                      ; preds = %29
  %34 = load i32* %j, align 4
  %35 = load i32** %6, align 4
  %36 = getelementptr inbounds i32* %35, i32 %34
  %37 = load i32* %36, align 4
  %38 = sitofp i32 %37 to float
  br label %39

; <label>:39                                      ; preds = %33, %32
  %40 = phi float [ 0.000000e+00, %32 ], [ %38, %33 ]
  %41 = load i32* %i, align 4
  %42 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %41
  store float %40, float* %42, align 4
  br label %43

; <label>:43                                      ; preds = %39
  %44 = load i32* %i, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %i, align 4
  %46 = load i32* %j, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %j, align 4
  br label %25

; <label>:48                                      ; preds = %25
  br label %49

; <label>:49                                      ; preds = %79, %48
  %storemerge = phi i32 [ 0, %48 ], [ %81, %79 ]
  store i32 %storemerge, i32* %i, align 4
  %50 = load i32* %jk, align 4
  %51 = icmp sgt i32 %storemerge, %50
  br i1 %51, label %82, label %52

; <label>:52                                      ; preds = %49
  store i32 0, i32* %j, align 4
  store float 0.000000e+00, float* %fw, align 4
  br label %53

; <label>:53                                      ; preds = %72, %52
  %54 = load i32* %j, align 4
  %55 = load i32* %jx, align 4
  %56 = icmp sgt i32 %54, %55
  br i1 %56, label %75, label %57

; <label>:57                                      ; preds = %53
  %58 = load i32* %j, align 4
  %59 = load float** %1, align 4
  %60 = getelementptr inbounds float* %59, i32 %58
  %61 = load float* %60, align 4
  %62 = load i32* %jx, align 4
  %63 = load i32* %i, align 4
  %64 = add nsw i32 %62, %63
  %65 = load i32* %j, align 4
  %66 = sub nsw i32 %64, %65
  %67 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %66
  %68 = load float* %67, align 4
  %69 = fmul float %61, %68
  %70 = load float* %fw, align 4
  %71 = fadd float %70, %69
  store float %71, float* %fw, align 4
  br label %72

; <label>:72                                      ; preds = %57
  %73 = load i32* %j, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %j, align 4
  br label %53

; <label>:75                                      ; preds = %53
  %76 = load float* %fw, align 4
  %77 = load i32* %i, align 4
  %78 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %77
  store float %76, float* %78, align 4
  br label %79

; <label>:79                                      ; preds = %75
  %80 = load i32* %i, align 4
  %81 = add nsw i32 %80, 1
  br label %49

; <label>:82                                      ; preds = %49
  %83 = load i32* %jk, align 4
  br label %84

; <label>:84                                      ; preds = %307, %82
  %storemerge1 = phi i32 [ %83, %82 ], [ %310, %307 ]
  store i32 %storemerge1, i32* %jz, align 4
  store i32 0, i32* %i, align 4
  store i32 %storemerge1, i32* %j, align 4
  %85 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %storemerge1
  %86 = load float* %85, align 4
  store float %86, float* %z, align 4
  br label %87

; <label>:87                                      ; preds = %106, %84
  %88 = load i32* %j, align 4
  %89 = icmp sgt i32 %88, 0
  br i1 %89, label %90, label %111

; <label>:90                                      ; preds = %87
  %91 = load float* %z, align 4
  %92 = fmul float %91, 3.906250e-03
  %93 = fptosi float %92 to i32
  %94 = sitofp i32 %93 to float
  store float %94, float* %fw, align 4
  %95 = fmul float %94, 2.560000e+02
  %96 = fsub float %91, %95
  %97 = fptosi float %96 to i32
  %98 = load i32* %i, align 4
  %99 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %98
  store i32 %97, i32* %99, align 4
  %100 = load i32* %j, align 4
  %101 = add nsw i32 %100, -1
  %102 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %101
  %103 = load float* %102, align 4
  %104 = load float* %fw, align 4
  %105 = fadd float %103, %104
  store float %105, float* %z, align 4
  br label %106

; <label>:106                                     ; preds = %90
  %107 = load i32* %i, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %i, align 4
  %109 = load i32* %j, align 4
  %110 = add nsw i32 %109, -1
  store i32 %110, i32* %j, align 4
  br label %87

; <label>:111                                     ; preds = %87
  %112 = load float* %z, align 4
  %113 = load i32* %q0, align 4
  %114 = call float @scalbnf(float %112, i32 %113) #4
  %115 = fmul float %114, 1.250000e-01
  %116 = call float @floorf(float %115) #6
  %117 = fmul float %116, 8.000000e+00
  %118 = fsub float %114, %117
  store float %118, float* %z, align 4
  %119 = fptosi float %118 to i32
  store i32 %119, i32* %n, align 4
  %120 = sitofp i32 %119 to float
  %121 = fsub float %118, %120
  store float %121, float* %z, align 4
  store i32 0, i32* %ih, align 4
  %122 = load i32* %q0, align 4
  %123 = icmp sgt i32 %122, 0
  br i1 %123, label %124, label %149

; <label>:124                                     ; preds = %111
  %125 = load i32* %jz, align 4
  %126 = add nsw i32 %125, -1
  %127 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %126
  %128 = load i32* %127, align 4
  %129 = load i32* %q0, align 4
  %130 = sub nsw i32 8, %129
  %131 = ashr i32 %128, %130
  store i32 %131, i32* %i, align 4
  %132 = load i32* %n, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, i32* %n, align 4
  %134 = load i32* %q0, align 4
  %135 = sub nsw i32 8, %134
  %136 = shl i32 %131, %135
  %137 = load i32* %jz, align 4
  %138 = add nsw i32 %137, -1
  %139 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %138
  %140 = load i32* %139, align 4
  %141 = sub nsw i32 %140, %136
  store i32 %141, i32* %139, align 4
  %142 = load i32* %jz, align 4
  %143 = add nsw i32 %142, -1
  %144 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %143
  %145 = load i32* %144, align 4
  %146 = load i32* %q0, align 4
  %147 = sub nsw i32 7, %146
  %148 = ashr i32 %145, %147
  store i32 %148, i32* %ih, align 4
  br label %164

; <label>:149                                     ; preds = %111
  %150 = load i32* %q0, align 4
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %152, label %158

; <label>:152                                     ; preds = %149
  %153 = load i32* %jz, align 4
  %154 = add nsw i32 %153, -1
  %155 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %154
  %156 = load i32* %155, align 4
  %157 = ashr i32 %156, 8
  store i32 %157, i32* %ih, align 4
  br label %163

; <label>:158                                     ; preds = %149
  %159 = load float* %z, align 4
  %160 = fcmp ult float %159, 5.000000e-01
  br i1 %160, label %162, label %161

; <label>:161                                     ; preds = %158
  store i32 2, i32* %ih, align 4
  br label %162

; <label>:162                                     ; preds = %161, %158
  br label %163

; <label>:163                                     ; preds = %162, %152
  br label %164

; <label>:164                                     ; preds = %163, %124
  %165 = load i32* %ih, align 4
  %166 = icmp sgt i32 %165, 0
  br i1 %166, label %167, label %230

; <label>:167                                     ; preds = %164
  %168 = load i32* %n, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %n, align 4
  store i32 0, i32* %carry, align 4
  br label %170

; <label>:170                                     ; preds = %194, %167
  %storemerge15 = phi i32 [ 0, %167 ], [ %196, %194 ]
  store i32 %storemerge15, i32* %i, align 4
  %171 = load i32* %jz, align 4
  %172 = icmp slt i32 %storemerge15, %171
  br i1 %172, label %173, label %197

; <label>:173                                     ; preds = %170
  %174 = load i32* %i, align 4
  %175 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %174
  %176 = load i32* %175, align 4
  store i32 %176, i32* %j, align 4
  %177 = load i32* %carry, align 4
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %179, label %188

; <label>:179                                     ; preds = %173
  %180 = load i32* %j, align 4
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %187, label %182

; <label>:182                                     ; preds = %179
  store i32 1, i32* %carry, align 4
  %183 = load i32* %j, align 4
  %184 = sub nsw i32 256, %183
  %185 = load i32* %i, align 4
  %186 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %185
  store i32 %184, i32* %186, align 4
  br label %187

; <label>:187                                     ; preds = %182, %179
  br label %193

; <label>:188                                     ; preds = %173
  %189 = load i32* %j, align 4
  %190 = sub nsw i32 255, %189
  %191 = load i32* %i, align 4
  %192 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %191
  store i32 %190, i32* %192, align 4
  br label %193

; <label>:193                                     ; preds = %188, %187
  br label %194

; <label>:194                                     ; preds = %193
  %195 = load i32* %i, align 4
  %196 = add nsw i32 %195, 1
  br label %170

; <label>:197                                     ; preds = %170
  %198 = load i32* %q0, align 4
  %199 = icmp sgt i32 %198, 0
  br i1 %199, label %200, label %215

; <label>:200                                     ; preds = %197
  %201 = load i32* %q0, align 4
  switch i32 %201, label %214 [
    i32 1, label %202
    i32 2, label %208
  ]

; <label>:202                                     ; preds = %200
  %203 = load i32* %jz, align 4
  %204 = add nsw i32 %203, -1
  %205 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %204
  %206 = load i32* %205, align 4
  %207 = and i32 %206, 127
  store i32 %207, i32* %205, align 4
  br label %214

; <label>:208                                     ; preds = %200
  %209 = load i32* %jz, align 4
  %210 = add nsw i32 %209, -1
  %211 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %210
  %212 = load i32* %211, align 4
  %213 = and i32 %212, 63
  store i32 %213, i32* %211, align 4
  br label %214

; <label>:214                                     ; preds = %208, %202, %200
  br label %215

; <label>:215                                     ; preds = %214, %197
  %216 = load i32* %ih, align 4
  %217 = icmp eq i32 %216, 2
  br i1 %217, label %218, label %229

; <label>:218                                     ; preds = %215
  %219 = load float* %z, align 4
  %220 = fsub float 1.000000e+00, %219
  store float %220, float* %z, align 4
  %221 = load i32* %carry, align 4
  %222 = icmp eq i32 %221, 0
  br i1 %222, label %228, label %223

; <label>:223                                     ; preds = %218
  %224 = load i32* %q0, align 4
  %225 = call float @scalbnf(float 1.000000e+00, i32 %224) #4
  %226 = load float* %z, align 4
  %227 = fsub float %226, %225
  store float %227, float* %z, align 4
  br label %228

; <label>:228                                     ; preds = %223, %218
  br label %229

; <label>:229                                     ; preds = %228, %215
  br label %230

; <label>:230                                     ; preds = %229, %164
  %231 = load float* %z, align 4
  %232 = fcmp oeq float %231, 0.000000e+00
  br i1 %232, label %233, label %.loopexit

; <label>:233                                     ; preds = %230
  store i32 0, i32* %j, align 4
  %234 = load i32* %jz, align 4
  br label %235

; <label>:235                                     ; preds = %244, %233
  %storemerge12.in = phi i32 [ %234, %233 ], [ %245, %244 ]
  %storemerge12 = add nsw i32 %storemerge12.in, -1
  store i32 %storemerge12, i32* %i, align 4
  %236 = load i32* %jk, align 4
  %237 = icmp sgt i32 %storemerge12.in, %236
  br i1 %237, label %238, label %246

; <label>:238                                     ; preds = %235
  %239 = load i32* %i, align 4
  %240 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %239
  %241 = load i32* %240, align 4
  %242 = load i32* %j, align 4
  %243 = or i32 %242, %241
  store i32 %243, i32* %j, align 4
  br label %244

; <label>:244                                     ; preds = %238
  %245 = load i32* %i, align 4
  br label %235

; <label>:246                                     ; preds = %235
  %247 = load i32* %j, align 4
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %249, label %311

; <label>:249                                     ; preds = %246
  br label %250

; <label>:250                                     ; preds = %257, %249
  %storemerge13 = phi i32 [ 1, %249 ], [ %259, %257 ]
  store i32 %storemerge13, i32* %k, align 4
  %251 = load i32* %jk, align 4
  %252 = sub nsw i32 %251, %storemerge13
  %253 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %252
  %254 = load i32* %253, align 4
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %256, label %260

; <label>:256                                     ; preds = %250
  br label %257

; <label>:257                                     ; preds = %256
  %258 = load i32* %k, align 4
  %259 = add nsw i32 %258, 1
  br label %250

; <label>:260                                     ; preds = %250
  %261 = load i32* %jz, align 4
  br label %262

; <label>:262                                     ; preds = %305, %260
  %storemerge14.in = phi i32 [ %261, %260 ], [ %306, %305 ]
  %storemerge14 = add nsw i32 %storemerge14.in, 1
  store i32 %storemerge14, i32* %i, align 4
  %263 = load i32* %jz, align 4
  %264 = load i32* %k, align 4
  %265 = add nsw i32 %263, %264
  %266 = icmp slt i32 %storemerge14.in, %265
  br i1 %266, label %267, label %307

; <label>:267                                     ; preds = %262
  %268 = load i32* %jv, align 4
  %269 = load i32* %i, align 4
  %270 = add nsw i32 %268, %269
  %271 = load i32** %6, align 4
  %272 = getelementptr inbounds i32* %271, i32 %270
  %273 = load i32* %272, align 4
  %274 = sitofp i32 %273 to float
  %275 = load i32* %jx, align 4
  %276 = load i32* %i, align 4
  %277 = add nsw i32 %275, %276
  %278 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %277
  store float %274, float* %278, align 4
  store i32 0, i32* %j, align 4
  store float 0.000000e+00, float* %fw, align 4
  br label %279

; <label>:279                                     ; preds = %298, %267
  %280 = load i32* %j, align 4
  %281 = load i32* %jx, align 4
  %282 = icmp sgt i32 %280, %281
  br i1 %282, label %301, label %283

; <label>:283                                     ; preds = %279
  %284 = load i32* %j, align 4
  %285 = load float** %1, align 4
  %286 = getelementptr inbounds float* %285, i32 %284
  %287 = load float* %286, align 4
  %288 = load i32* %jx, align 4
  %289 = load i32* %i, align 4
  %290 = add nsw i32 %288, %289
  %291 = load i32* %j, align 4
  %292 = sub nsw i32 %290, %291
  %293 = getelementptr inbounds [20 x float]* %f, i32 0, i32 %292
  %294 = load float* %293, align 4
  %295 = fmul float %287, %294
  %296 = load float* %fw, align 4
  %297 = fadd float %296, %295
  store float %297, float* %fw, align 4
  br label %298

; <label>:298                                     ; preds = %283
  %299 = load i32* %j, align 4
  %300 = add nsw i32 %299, 1
  store i32 %300, i32* %j, align 4
  br label %279

; <label>:301                                     ; preds = %279
  %302 = load float* %fw, align 4
  %303 = load i32* %i, align 4
  %304 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %303
  store float %302, float* %304, align 4
  br label %305

; <label>:305                                     ; preds = %301
  %306 = load i32* %i, align 4
  br label %262

; <label>:307                                     ; preds = %262
  %308 = load i32* %k, align 4
  %309 = load i32* %jz, align 4
  %310 = add nsw i32 %309, %308
  br label %84

; <label>:311                                     ; preds = %246
  br label %312

.loopexit:                                        ; preds = %230
  br label %312

; <label>:312                                     ; preds = %.loopexit, %311
  %313 = load float* %z, align 4
  %314 = fcmp oeq float %313, 0.000000e+00
  br i1 %314, label %315, label %329

; <label>:315                                     ; preds = %312
  %316 = load i32* %jz, align 4
  %317 = add nsw i32 %316, -1
  store i32 %317, i32* %jz, align 4
  %318 = load i32* %q0, align 4
  br label %319

; <label>:319                                     ; preds = %324, %315
  %storemerge11.in = phi i32 [ %318, %315 ], [ %327, %324 ]
  %storemerge11 = add nsw i32 %storemerge11.in, -8
  store i32 %storemerge11, i32* %q0, align 4
  %320 = load i32* %jz, align 4
  %321 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %320
  %322 = load i32* %321, align 4
  %323 = icmp eq i32 %322, 0
  br i1 %323, label %324, label %328

; <label>:324                                     ; preds = %319
  %325 = load i32* %jz, align 4
  %326 = add nsw i32 %325, -1
  store i32 %326, i32* %jz, align 4
  %327 = load i32* %q0, align 4
  br label %319

; <label>:328                                     ; preds = %319
  br label %358

; <label>:329                                     ; preds = %312
  %330 = load float* %z, align 4
  %331 = load i32* %q0, align 4
  %332 = sub nsw i32 0, %331
  %333 = call float @scalbnf(float %330, i32 %332) #4
  store float %333, float* %z, align 4
  %334 = fcmp ult float %333, 2.560000e+02
  br i1 %334, label %352, label %335

; <label>:335                                     ; preds = %329
  %336 = load float* %z, align 4
  %337 = fmul float %336, 3.906250e-03
  %338 = fptosi float %337 to i32
  %339 = sitofp i32 %338 to float
  store float %339, float* %fw, align 4
  %340 = fmul float %339, 2.560000e+02
  %341 = fsub float %336, %340
  %342 = fptosi float %341 to i32
  %343 = load i32* %jz, align 4
  %344 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %343
  store i32 %342, i32* %344, align 4
  %345 = load i32* %jz, align 4
  %346 = add nsw i32 %345, 1
  store i32 %346, i32* %jz, align 4
  %347 = load i32* %q0, align 4
  %348 = add nsw i32 %347, 8
  store i32 %348, i32* %q0, align 4
  %349 = load float* %fw, align 4
  %350 = fptosi float %349 to i32
  %351 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %346
  store i32 %350, i32* %351, align 4
  br label %357

; <label>:352                                     ; preds = %329
  %353 = load float* %z, align 4
  %354 = fptosi float %353 to i32
  %355 = load i32* %jz, align 4
  %356 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %355
  store i32 %354, i32* %356, align 4
  br label %357

; <label>:357                                     ; preds = %352, %335
  br label %358

; <label>:358                                     ; preds = %357, %328
  %359 = load i32* %q0, align 4
  %360 = call float @scalbnf(float 1.000000e+00, i32 %359) #4
  store float %360, float* %fw, align 4
  %361 = load i32* %jz, align 4
  br label %362

; <label>:362                                     ; preds = %374, %358
  %storemerge2 = phi i32 [ %361, %358 ], [ %376, %374 ]
  store i32 %storemerge2, i32* %i, align 4
  %363 = icmp sgt i32 %storemerge2, -1
  br i1 %363, label %364, label %377

; <label>:364                                     ; preds = %362
  %365 = load float* %fw, align 4
  %366 = load i32* %i, align 4
  %367 = getelementptr inbounds [20 x i32]* %iq, i32 0, i32 %366
  %368 = load i32* %367, align 4
  %369 = sitofp i32 %368 to float
  %370 = fmul float %365, %369
  %371 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %366
  store float %370, float* %371, align 4
  %372 = load float* %fw, align 4
  %373 = fmul float %372, 3.906250e-03
  store float %373, float* %fw, align 4
  br label %374

; <label>:374                                     ; preds = %364
  %375 = load i32* %i, align 4
  %376 = add nsw i32 %375, -1
  br label %362

; <label>:377                                     ; preds = %362
  %378 = load i32* %jz, align 4
  br label %379

; <label>:379                                     ; preds = %413, %377
  %storemerge3 = phi i32 [ %378, %377 ], [ %415, %413 ]
  store i32 %storemerge3, i32* %i, align 4
  %380 = icmp sgt i32 %storemerge3, -1
  br i1 %380, label %381, label %416

; <label>:381                                     ; preds = %379
  store float 0.000000e+00, float* %fw, align 4
  br label %382

; <label>:382                                     ; preds = %404, %381
  %storemerge10 = phi i32 [ 0, %381 ], [ %406, %404 ]
  store i32 %storemerge10, i32* %k, align 4
  %383 = load i32* %jp, align 4
  %384 = icmp sgt i32 %storemerge10, %383
  br i1 %384, label %391, label %385

; <label>:385                                     ; preds = %382
  %386 = load i32* %k, align 4
  %387 = load i32* %jz, align 4
  %388 = load i32* %i, align 4
  %389 = sub nsw i32 %387, %388
  %390 = icmp sle i32 %386, %389
  br label %391

; <label>:391                                     ; preds = %385, %382
  %392 = phi i1 [ false, %382 ], [ %390, %385 ]
  br i1 %392, label %393, label %407

; <label>:393                                     ; preds = %391
  %394 = load i32* %k, align 4
  %395 = getelementptr inbounds [11 x float]* @PIo2, i32 0, i32 %394
  %396 = load float* %395, align 4
  %397 = load i32* %i, align 4
  %398 = add nsw i32 %397, %394
  %399 = getelementptr inbounds [20 x float]* %q, i32 0, i32 %398
  %400 = load float* %399, align 4
  %401 = fmul float %396, %400
  %402 = load float* %fw, align 4
  %403 = fadd float %402, %401
  store float %403, float* %fw, align 4
  br label %404

; <label>:404                                     ; preds = %393
  %405 = load i32* %k, align 4
  %406 = add nsw i32 %405, 1
  br label %382

; <label>:407                                     ; preds = %391
  %408 = load float* %fw, align 4
  %409 = load i32* %jz, align 4
  %410 = load i32* %i, align 4
  %411 = sub nsw i32 %409, %410
  %412 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %411
  store float %408, float* %412, align 4
  br label %413

; <label>:413                                     ; preds = %407
  %414 = load i32* %i, align 4
  %415 = add nsw i32 %414, -1
  br label %379

; <label>:416                                     ; preds = %379
  %417 = load i32* %5, align 4
  switch i32 %417, label %590 [
    i32 0, label %418
    i32 1, label %442
    i32 2, label %442
    i32 3, label %494
  ]

; <label>:418                                     ; preds = %416
  store float 0.000000e+00, float* %fw, align 4
  %419 = load i32* %jz, align 4
  br label %420

; <label>:420                                     ; preds = %428, %418
  %storemerge9 = phi i32 [ %419, %418 ], [ %430, %428 ]
  store i32 %storemerge9, i32* %i, align 4
  %421 = icmp sgt i32 %storemerge9, -1
  br i1 %421, label %422, label %431

; <label>:422                                     ; preds = %420
  %423 = load i32* %i, align 4
  %424 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %423
  %425 = load float* %424, align 4
  %426 = load float* %fw, align 4
  %427 = fadd float %426, %425
  store float %427, float* %fw, align 4
  br label %428

; <label>:428                                     ; preds = %422
  %429 = load i32* %i, align 4
  %430 = add nsw i32 %429, -1
  br label %420

; <label>:431                                     ; preds = %420
  %432 = load i32* %ih, align 4
  %433 = icmp eq i32 %432, 0
  br i1 %433, label %434, label %436

; <label>:434                                     ; preds = %431
  %435 = load float* %fw, align 4
  br label %439

; <label>:436                                     ; preds = %431
  %437 = load float* %fw, align 4
  %438 = fsub float -0.000000e+00, %437
  br label %439

; <label>:439                                     ; preds = %436, %434
  %440 = phi float [ %435, %434 ], [ %438, %436 ]
  %441 = load float** %2, align 4
  store float %440, float* %441, align 4
  br label %590

; <label>:442                                     ; preds = %416, %416
  store float 0.000000e+00, float* %fw, align 4
  %443 = load i32* %jz, align 4
  br label %444

; <label>:444                                     ; preds = %452, %442
  %storemerge7 = phi i32 [ %443, %442 ], [ %454, %452 ]
  store i32 %storemerge7, i32* %i, align 4
  %445 = icmp sgt i32 %storemerge7, -1
  br i1 %445, label %446, label %455

; <label>:446                                     ; preds = %444
  %447 = load i32* %i, align 4
  %448 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %447
  %449 = load float* %448, align 4
  %450 = load float* %fw, align 4
  %451 = fadd float %450, %449
  store float %451, float* %fw, align 4
  br label %452

; <label>:452                                     ; preds = %446
  %453 = load i32* %i, align 4
  %454 = add nsw i32 %453, -1
  br label %444

; <label>:455                                     ; preds = %444
  %456 = load i32* %ih, align 4
  %457 = icmp eq i32 %456, 0
  br i1 %457, label %458, label %460

; <label>:458                                     ; preds = %455
  %459 = load float* %fw, align 4
  br label %463

; <label>:460                                     ; preds = %455
  %461 = load float* %fw, align 4
  %462 = fsub float -0.000000e+00, %461
  br label %463

; <label>:463                                     ; preds = %460, %458
  %464 = phi float [ %459, %458 ], [ %462, %460 ]
  %465 = load float** %2, align 4
  store float %464, float* %465, align 4
  %466 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 0
  %467 = load float* %466, align 4
  %468 = load float* %fw, align 4
  %469 = fsub float %467, %468
  store float %469, float* %fw, align 4
  br label %470

; <label>:470                                     ; preds = %479, %463
  %storemerge8 = phi i32 [ 1, %463 ], [ %481, %479 ]
  store i32 %storemerge8, i32* %i, align 4
  %471 = load i32* %jz, align 4
  %472 = icmp sgt i32 %storemerge8, %471
  br i1 %472, label %482, label %473

; <label>:473                                     ; preds = %470
  %474 = load i32* %i, align 4
  %475 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %474
  %476 = load float* %475, align 4
  %477 = load float* %fw, align 4
  %478 = fadd float %477, %476
  store float %478, float* %fw, align 4
  br label %479

; <label>:479                                     ; preds = %473
  %480 = load i32* %i, align 4
  %481 = add nsw i32 %480, 1
  br label %470

; <label>:482                                     ; preds = %470
  %483 = load i32* %ih, align 4
  %484 = icmp eq i32 %483, 0
  br i1 %484, label %485, label %487

; <label>:485                                     ; preds = %482
  %486 = load float* %fw, align 4
  br label %490

; <label>:487                                     ; preds = %482
  %488 = load float* %fw, align 4
  %489 = fsub float -0.000000e+00, %488
  br label %490

; <label>:490                                     ; preds = %487, %485
  %491 = phi float [ %486, %485 ], [ %489, %487 ]
  %492 = load float** %2, align 4
  %493 = getelementptr inbounds float* %492, i32 1
  store float %491, float* %493, align 4
  br label %590

; <label>:494                                     ; preds = %416
  %495 = load i32* %jz, align 4
  br label %496

; <label>:496                                     ; preds = %518, %494
  %storemerge4 = phi i32 [ %495, %494 ], [ %520, %518 ]
  store i32 %storemerge4, i32* %i, align 4
  %497 = icmp sgt i32 %storemerge4, 0
  br i1 %497, label %498, label %521

; <label>:498                                     ; preds = %496
  %499 = load i32* %i, align 4
  %500 = add nsw i32 %499, -1
  %501 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %500
  %502 = load float* %501, align 4
  %503 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %499
  %504 = load float* %503, align 4
  %505 = fadd float %502, %504
  store float %505, float* %fw, align 4
  %506 = load i32* %i, align 4
  %507 = add nsw i32 %506, -1
  %508 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %507
  %509 = load float* %508, align 4
  %510 = fsub float %509, %505
  %511 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %506
  %512 = load float* %511, align 4
  %513 = fadd float %512, %510
  store float %513, float* %511, align 4
  %514 = load float* %fw, align 4
  %515 = load i32* %i, align 4
  %516 = add nsw i32 %515, -1
  %517 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %516
  store float %514, float* %517, align 4
  br label %518

; <label>:518                                     ; preds = %498
  %519 = load i32* %i, align 4
  %520 = add nsw i32 %519, -1
  br label %496

; <label>:521                                     ; preds = %496
  %522 = load i32* %jz, align 4
  br label %523

; <label>:523                                     ; preds = %545, %521
  %storemerge5 = phi i32 [ %522, %521 ], [ %547, %545 ]
  store i32 %storemerge5, i32* %i, align 4
  %524 = icmp sgt i32 %storemerge5, 1
  br i1 %524, label %525, label %548

; <label>:525                                     ; preds = %523
  %526 = load i32* %i, align 4
  %527 = add nsw i32 %526, -1
  %528 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %527
  %529 = load float* %528, align 4
  %530 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %526
  %531 = load float* %530, align 4
  %532 = fadd float %529, %531
  store float %532, float* %fw, align 4
  %533 = load i32* %i, align 4
  %534 = add nsw i32 %533, -1
  %535 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %534
  %536 = load float* %535, align 4
  %537 = fsub float %536, %532
  %538 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %533
  %539 = load float* %538, align 4
  %540 = fadd float %539, %537
  store float %540, float* %538, align 4
  %541 = load float* %fw, align 4
  %542 = load i32* %i, align 4
  %543 = add nsw i32 %542, -1
  %544 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %543
  store float %541, float* %544, align 4
  br label %545

; <label>:545                                     ; preds = %525
  %546 = load i32* %i, align 4
  %547 = add nsw i32 %546, -1
  br label %523

; <label>:548                                     ; preds = %523
  store float 0.000000e+00, float* %fw, align 4
  %549 = load i32* %jz, align 4
  br label %550

; <label>:550                                     ; preds = %558, %548
  %storemerge6 = phi i32 [ %549, %548 ], [ %560, %558 ]
  store i32 %storemerge6, i32* %i, align 4
  %551 = icmp sgt i32 %storemerge6, 1
  br i1 %551, label %552, label %561

; <label>:552                                     ; preds = %550
  %553 = load i32* %i, align 4
  %554 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 %553
  %555 = load float* %554, align 4
  %556 = load float* %fw, align 4
  %557 = fadd float %556, %555
  store float %557, float* %fw, align 4
  br label %558

; <label>:558                                     ; preds = %552
  %559 = load i32* %i, align 4
  %560 = add nsw i32 %559, -1
  br label %550

; <label>:561                                     ; preds = %550
  %562 = load i32* %ih, align 4
  %563 = icmp eq i32 %562, 0
  br i1 %563, label %564, label %575

; <label>:564                                     ; preds = %561
  %565 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 0
  %566 = load float* %565, align 4
  %567 = load float** %2, align 4
  store float %566, float* %567, align 4
  %568 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 1
  %569 = load float* %568, align 4
  %570 = load float** %2, align 4
  %571 = getelementptr inbounds float* %570, i32 1
  store float %569, float* %571, align 4
  %572 = load float* %fw, align 4
  %573 = load float** %2, align 4
  %574 = getelementptr inbounds float* %573, i32 2
  store float %572, float* %574, align 4
  br label %589

; <label>:575                                     ; preds = %561
  %576 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 0
  %577 = load float* %576, align 4
  %578 = fsub float -0.000000e+00, %577
  %579 = load float** %2, align 4
  store float %578, float* %579, align 4
  %580 = getelementptr inbounds [20 x float]* %fq, i32 0, i32 1
  %581 = load float* %580, align 4
  %582 = fsub float -0.000000e+00, %581
  %583 = load float** %2, align 4
  %584 = getelementptr inbounds float* %583, i32 1
  store float %582, float* %584, align 4
  %585 = load float* %fw, align 4
  %586 = fsub float -0.000000e+00, %585
  %587 = load float** %2, align 4
  %588 = getelementptr inbounds float* %587, i32 2
  store float %586, float* %588, align 4
  br label %589

; <label>:589                                     ; preds = %575, %564
  br label %590

; <label>:590                                     ; preds = %589, %490, %439, %416
  %591 = load i32* %n, align 4
  %592 = and i32 %591, 7
  ret i32 %592
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
  %7 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u, i32 0, i32 0
  store float %6, float* %7, align 4
  %8 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %9 = load i32* %8, align 4
  store i32 %9, i32* %ix, align 4
  br label %10

; <label>:10                                      ; preds = %5
  %11 = load i32* %ix, align 4
  %12 = and i32 %11, 2147483647
  store i32 %12, i32* %ix, align 4
  %13 = icmp ult i32 %12, 838860800
  br i1 %13, label %14, label %21

; <label>:14                                      ; preds = %10
  %15 = load float* %2, align 4
  %16 = fptosi float %15 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %14
  %19 = load float* %2, align 4
  store float %19, float* %1, align 4
  br label %60

; <label>:20                                      ; preds = %14
  br label %21

; <label>:21                                      ; preds = %20, %10
  %22 = load float* %2, align 4
  %23 = fmul float %22, %22
  store float %23, float* %z, align 4
  %24 = fmul float %23, %22
  store float %24, float* %v, align 4
  %25 = fmul float %23, 0x3DE5D93A60000000
  %26 = fadd float %25, 0xBE5AE5E680000000
  %27 = fmul float %23, %26
  %28 = fadd float %27, 0x3EC71DE360000000
  %29 = fmul float %23, %28
  %30 = fadd float %29, 0xBF2A01A020000000
  %31 = fmul float %23, %30
  %32 = fadd float %31, 0x3F81111120000000
  store float %32, float* %r, align 4
  %33 = load i32* %4, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %44

; <label>:35                                      ; preds = %21
  %36 = load float* %2, align 4
  %37 = load float* %v, align 4
  %38 = load float* %z, align 4
  %39 = load float* %r, align 4
  %40 = fmul float %38, %39
  %41 = fadd float %40, 0xBFC5555560000000
  %42 = fmul float %37, %41
  %43 = fadd float %36, %42
  store float %43, float* %1, align 4
  br label %60

; <label>:44                                      ; preds = %21
  %45 = load float* %2, align 4
  %46 = load float* %z, align 4
  %47 = load float* %3, align 4
  %48 = fmul float %47, 5.000000e-01
  %49 = load float* %v, align 4
  %50 = load float* %r, align 4
  %51 = fmul float %49, %50
  %52 = fsub float %48, %51
  %53 = fmul float %46, %52
  %54 = load float* %3, align 4
  %55 = fsub float %53, %54
  %56 = load float* %v, align 4
  %57 = fmul float %56, 0xBFC5555560000000
  %58 = fsub float %55, %57
  %59 = fsub float %45, %58
  store float %59, float* %1, align 4
  br label %60

; <label>:60                                      ; preds = %44, %35, %18
  %61 = load float* %1, align 4
  ret float %61
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
  %4 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u, i32 0, i32 0
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
  %12 = getelementptr inbounds %union.ieee_float_shape_type* %sf_u, i32 0, i32 0
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
  %5 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u, i32 0, i32 0
  store float %4, float* %5, align 4
  %6 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %7 = load i32* %6, align 4
  store i32 %7, i32* %i0, align 4
  br label %8

; <label>:8                                       ; preds = %3
  %9 = load i32* %i0, align 4
  %10 = and i32 %9, 2147483647
  store i32 %10, i32* %ix, align 4
  %11 = lshr i32 %10, 23
  %12 = add nsw i32 %11, -127
  store i32 %12, i32* %j0, align 4
  %13 = icmp slt i32 %12, 23
  br i1 %13, label %14, label %59

; <label>:14                                      ; preds = %8
  %15 = load i32* %j0, align 4
  %16 = icmp slt i32 %15, 0
  br i1 %16, label %17, label %32

; <label>:17                                      ; preds = %14
  %18 = load float* %2, align 4
  %19 = fadd float %18, 0x46293E5940000000
  %20 = fcmp ogt float %19, 0.000000e+00
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %17
  %22 = load i32* %i0, align 4
  %23 = icmp sgt i32 %22, -1
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  store i32 0, i32* %i0, align 4
  br label %30

; <label>:25                                      ; preds = %21
  %26 = load i32* %ix, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %29, label %28

; <label>:28                                      ; preds = %25
  store i32 -1082130432, i32* %i0, align 4
  br label %29

; <label>:29                                      ; preds = %28, %25
  br label %30

; <label>:30                                      ; preds = %29, %24
  br label %31

; <label>:31                                      ; preds = %30, %17
  br label %58

; <label>:32                                      ; preds = %14
  %33 = load i32* %j0, align 4
  %34 = lshr i32 8388607, %33
  store i32 %34, i32* %i, align 4
  %35 = load i32* %i0, align 4
  %36 = and i32 %35, %34
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %32
  %39 = load float* %2, align 4
  store float %39, float* %1, align 4
  br label %75

; <label>:40                                      ; preds = %32
  %41 = load float* %2, align 4
  %42 = fadd float %41, 0x46293E5940000000
  %43 = fcmp ogt float %42, 0.000000e+00
  br i1 %43, label %44, label %57

; <label>:44                                      ; preds = %40
  %45 = load i32* %i0, align 4
  %46 = icmp slt i32 %45, 0
  br i1 %46, label %47, label %52

; <label>:47                                      ; preds = %44
  %48 = load i32* %j0, align 4
  %49 = lshr i32 8388608, %48
  %50 = load i32* %i0, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, i32* %i0, align 4
  br label %52

; <label>:52                                      ; preds = %47, %44
  %53 = load i32* %i, align 4
  %54 = xor i32 %53, -1
  %55 = load i32* %i0, align 4
  %56 = and i32 %55, %54
  store i32 %56, i32* %i0, align 4
  br label %57

; <label>:57                                      ; preds = %52, %40
  br label %58

; <label>:58                                      ; preds = %57, %31
  br label %67

; <label>:59                                      ; preds = %8
  %60 = load i32* %ix, align 4
  %61 = icmp ult i32 %60, 2139095040
  br i1 %61, label %65, label %62

; <label>:62                                      ; preds = %59
  %63 = load float* %2, align 4
  %64 = fadd float %63, %63
  store float %64, float* %1, align 4
  br label %75

; <label>:65                                      ; preds = %59
  %66 = load float* %2, align 4
  store float %66, float* %1, align 4
  br label %75

; <label>:67                                      ; preds = %58
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32* %i0, align 4
  %70 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %69, i32* %70, align 4
  %71 = getelementptr inbounds %union.ieee_float_shape_type* %sf_u, i32 0, i32 0
  %72 = load float* %71, align 4
  store float %72, float* %2, align 4
  br label %73

; <label>:73                                      ; preds = %68
  %74 = load float* %2, align 4
  store float %74, float* %1, align 4
  br label %75

; <label>:75                                      ; preds = %73, %65, %62, %38
  %76 = load float* %1, align 4
  ret float %76
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
  %6 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u, i32 0, i32 0
  store float %5, float* %6, align 4
  %7 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %8 = load i32* %7, align 4
  store i32 %8, i32* %ix, align 4
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load i32* %ix, align 4
  %11 = and i32 %10, 2147483647
  store i32 %11, i32* %hx, align 4
  %12 = lshr i32 %11, 23
  store i32 %12, i32* %k, align 4
  %13 = icmp eq i32 %11, 0
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %9
  %15 = load float* %2, align 4
  store float %15, float* %1, align 4
  br label %97

; <label>:16                                      ; preds = %9
  %17 = load i32* %hx, align 4
  %18 = icmp ult i32 %17, 2139095040
  br i1 %18, label %22, label %19

; <label>:19                                      ; preds = %16
  %20 = load float* %2, align 4
  %21 = fadd float %20, %20
  store float %21, float* %1, align 4
  br label %97

; <label>:22                                      ; preds = %16
  %23 = load i32* %hx, align 4
  %24 = icmp ult i32 %23, 8388608
  br i1 %24, label %25, label %44

; <label>:25                                      ; preds = %22
  %26 = load float* %2, align 4
  %27 = fmul float %26, 0x4180000000000000
  store float %27, float* %2, align 4
  br label %28

; <label>:28                                      ; preds = %25
  %29 = load float* %2, align 4
  %30 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u1, i32 0, i32 0
  store float %29, float* %30, align 4
  %31 = bitcast %union.ieee_float_shape_type* %gf_u1 to i32*
  %32 = load i32* %31, align 4
  store i32 %32, i32* %ix, align 4
  br label %33

; <label>:33                                      ; preds = %28
  %34 = load i32* %ix, align 4
  %35 = lshr i32 %34, 23
  %36 = and i32 %35, 255
  %37 = add nsw i32 %36, -25
  store i32 %37, i32* %k, align 4
  %38 = load i32* %3, align 4
  %39 = icmp slt i32 %38, -50000
  br i1 %39, label %40, label %43

; <label>:40                                      ; preds = %33
  %41 = load float* %2, align 4
  %42 = fmul float %41, 0x39B4484C00000000
  store float %42, float* %1, align 4
  br label %97

; <label>:43                                      ; preds = %33
  br label %44

; <label>:44                                      ; preds = %43, %22
  %45 = load i32* %k, align 4
  %46 = load i32* %3, align 4
  %47 = add nsw i32 %45, %46
  store i32 %47, i32* %k, align 4
  %48 = icmp sgt i32 %47, 254
  br i1 %48, label %49, label %53

; <label>:49                                      ; preds = %44
  %50 = load float* %2, align 4
  %51 = call float @copysignf(float 0x46293E5940000000, float %50) #6
  %52 = fmul float %51, 0x46293E5940000000
  store float %52, float* %1, align 4
  br label %97

; <label>:53                                      ; preds = %44
  %54 = load i32* %k, align 4
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %68

; <label>:56                                      ; preds = %53
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32* %ix, align 4
  %59 = and i32 %58, -2139095041
  %60 = load i32* %k, align 4
  %61 = shl i32 %60, 23
  %62 = or i32 %59, %61
  %63 = bitcast %union.ieee_float_shape_type* %sf_u to i32*
  store i32 %62, i32* %63, align 4
  %64 = getelementptr inbounds %union.ieee_float_shape_type* %sf_u, i32 0, i32 0
  %65 = load float* %64, align 4
  store float %65, float* %2, align 4
  br label %66

; <label>:66                                      ; preds = %57
  %67 = load float* %2, align 4
  store float %67, float* %1, align 4
  br label %97

; <label>:68                                      ; preds = %53
  %69 = load i32* %k, align 4
  %70 = icmp slt i32 %69, -22
  br i1 %70, label %71, label %82

; <label>:71                                      ; preds = %68
  %72 = load i32* %3, align 4
  %73 = icmp sgt i32 %72, 50000
  br i1 %73, label %74, label %78

; <label>:74                                      ; preds = %71
  %75 = load float* %2, align 4
  %76 = call float @copysignf(float 0x46293E5940000000, float %75) #6
  %77 = fmul float %76, 0x46293E5940000000
  store float %77, float* %1, align 4
  br label %97

; <label>:78                                      ; preds = %71
  %79 = load float* %2, align 4
  %80 = call float @copysignf(float 0x39B4484C00000000, float %79) #6
  %81 = fmul float %80, 0x39B4484C00000000
  store float %81, float* %1, align 4
  br label %97

; <label>:82                                      ; preds = %68
  %83 = load i32* %k, align 4
  %84 = add nsw i32 %83, 25
  store i32 %84, i32* %k, align 4
  br label %85

; <label>:85                                      ; preds = %82
  %86 = load i32* %ix, align 4
  %87 = and i32 %86, -2139095041
  %88 = load i32* %k, align 4
  %89 = shl i32 %88, 23
  %90 = or i32 %87, %89
  %91 = bitcast %union.ieee_float_shape_type* %sf_u2 to i32*
  store i32 %90, i32* %91, align 4
  %92 = getelementptr inbounds %union.ieee_float_shape_type* %sf_u2, i32 0, i32 0
  %93 = load float* %92, align 4
  store float %93, float* %2, align 4
  br label %94

; <label>:94                                      ; preds = %85
  %95 = load float* %2, align 4
  %96 = fmul float %95, 0x3E60000000000000
  store float %96, float* %1, align 4
  br label %97

; <label>:97                                      ; preds = %94, %78, %74, %66, %49, %40, %19, %14
  %98 = load float* %1, align 4
  ret float %98
}

; Function Attrs: nounwind
define internal float @sinf(float %x) #3 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %y = alloca [2 x float], align 4
  %z = alloca float, align 4
  %ix = alloca i32, align 4
  %gf_u = alloca %union.ieee_float_shape_type, align 4
  store float %x, float* %2, align 4
  store float 0.000000e+00, float* %z, align 4
  br label %3

; <label>:3                                       ; preds = %0
  %4 = load float* %2, align 4
  %5 = getelementptr inbounds %union.ieee_float_shape_type* %gf_u, i32 0, i32 0
  store float %4, float* %5, align 4
  %6 = bitcast %union.ieee_float_shape_type* %gf_u to i32*
  %7 = load i32* %6, align 4
  store i32 %7, i32* %ix, align 4
  br label %8

; <label>:8                                       ; preds = %3
  %9 = load i32* %ix, align 4
  %10 = and i32 %9, 2147483647
  store i32 %10, i32* %ix, align 4
  %11 = icmp ult i32 %10, 1061752793
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %8
  %13 = load float* %2, align 4
  %14 = load float* %z, align 4
  %15 = call float @__kernel_sinf(float %13, float %14, i32 0) #5
  store float %15, float* %1, align 4
  br label %53

; <label>:16                                      ; preds = %8
  %17 = load i32* %ix, align 4
  %18 = icmp slt i32 %17, 2139095040
  br i1 %18, label %22, label %19

; <label>:19                                      ; preds = %16
  %20 = load float* %2, align 4
  %21 = fsub float %20, %20
  store float %21, float* %1, align 4
  br label %53

; <label>:22                                      ; preds = %16
  %23 = load float* %2, align 4
  %24 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %25 = call i32 @__ieee754_rem_pio2f(float %23, float* %24) #5
  %26 = and i32 %25, 3
  switch i32 %26, label %46 [
    i32 0, label %27
    i32 1, label %33
    i32 2, label %39
  ]

; <label>:27                                      ; preds = %22
  %28 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %29 = load float* %28, align 4
  %30 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %31 = load float* %30, align 4
  %32 = call float @__kernel_sinf(float %29, float %31, i32 1) #5
  store float %32, float* %1, align 4
  br label %53

; <label>:33                                      ; preds = %22
  %34 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %35 = load float* %34, align 4
  %36 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %37 = load float* %36, align 4
  %38 = call float @__kernel_cosf(float %35, float %37) #5
  store float %38, float* %1, align 4
  br label %53

; <label>:39                                      ; preds = %22
  %40 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %41 = load float* %40, align 4
  %42 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %43 = load float* %42, align 4
  %44 = call float @__kernel_sinf(float %41, float %43, i32 1) #5
  %45 = fsub float -0.000000e+00, %44
  store float %45, float* %1, align 4
  br label %53

; <label>:46                                      ; preds = %22
  %47 = getelementptr inbounds [2 x float]* %y, i32 0, i32 0
  %48 = load float* %47, align 4
  %49 = getelementptr inbounds [2 x float]* %y, i32 0, i32 1
  %50 = load float* %49, align 4
  %51 = call float @__kernel_cosf(float %48, float %50) #5
  %52 = fsub float -0.000000e+00, %51
  store float %52, float* %1, align 4
  br label %53

; <label>:53                                      ; preds = %46, %39, %33, %27, %19, %12
  %54 = load float* %1, align 4
  ret float %54
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

#
# ECE369
# 

########################################################################################################################
### data
########################################################################################################################
.data
# test input
# asize : dimensions of the frame [i, j] and window [k, l]
#         i: number of rows,  j: number of cols
#         k: number of rows,  l: number of cols  
# frame : frame data with i*j number of pixel values
# window: search window with k*l number of pixel values
#
# $v0 is for row / $v1 is for column

# test 1 For the 16X16 frame size and a 8X4 window size
# The result should be 3, 2
asize1:  .word    16, 16, 8, 4    #i, j, k, l
frame1:  .word    7, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
         .word    7, 8, 8, 8, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 
         .word    7, 8, 8, 8, 2, 8, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 
         .word    7, 8, 8, 8, 8, 8, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 
         .word    0, 4, 8, 8, 8, 8, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 
         .word    0, 5, 8, 8, 8, 8, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75, 
         .word    0, 6, 8, 8, 8, 8, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
         .word    0, 4, 8, 8, 8, 8, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
         .word    0, 1, 8, 8, 8, 8, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
         .word    0, 1, 8, 8, 8, 8, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
         .word    0, 10, 8, 8, 8, 8, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
         .word    0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
         .word    9, 9, 9, 9, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4, 
         .word    9, 9, 9, 9, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5, 
         .word    9, 9, 9, 9, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6 
window1: .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8 

# test 2 For the 32X32 frame and a 8X16 window size
# The result should be 16, 0
asize2:  .word    32, 32, 8, 16    #i, j, k, l
frame2:  .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 
         .word    1, 1, 1, 1, 1, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8
         
window2: .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         
# test 3 For the 16X16 frame and a 4X8 window size
# The result should be 12, 0
asize3:  .word    16, 16, 4, 8    #i, j, k, l
frame3:  .word    9, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 7, 7, 
         .word    9, 7, 7, 7, 7, 5, 6, 7, 8, 9, 10, 11, 6, 7, 7, 7, 
         .word    9, 7, 7, 7, 7, 3, 12, 14, 16, 18, 20, 6, 6, 7, 7, 7, 
         .word    9, 7, 7, 7, 7, 4, 18, 21, 24, 27, 30, 33, 6, 7, 7, 7, 
         .word    0, 7, 7, 7, 7, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 
         .word    0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75, 
         .word    0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
         .word    0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
         .word    0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
         .word    0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
         .word    0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
         .word    0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3
         
window3: .word    9, 9, 9, 9, 9, 9, 9, 9, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 
         .word    9, 9, 9, 9, 9, 9, 9, 9, 
         .word    9, 9, 9, 9, 9, 9, 9, 9
     
# test 4 For the 16X16 frame and a 8X8 window size
# The result should be 8, 3
asize4: .word    16, 16, 8, 8    #i, j, k, l
frame4: .word    9, 19, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 91, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 19, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 91, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    91, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 19, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 91, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    1, 2, 3, 9, 9, 19, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0, 
         .word    1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 96, 108, 120, 132, 0
                  
window4:   .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9, 
            .word    9, 9, 9, 9, 9, 9, 9, 9
   
# test 5 For the 32X32 frame and a 4X4 window size
# The result should be 5, 16 since its the first of multiple repeating occurrences
asize5: .word    32, 32, 4, 4    #i, j, k, l
frame5: .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
         .word    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
                  
window5:   .word    10, 10, 10, 10, 
            .word    10, 10, 10, 10, 
            .word    10, 10, 10, 10, 
            .word    10, 10, 10, 10

newline: .asciiz     "\n" 

########################################################################################################################
### main
########################################################################################################################

.text

.globl main

main: 
    addi    $sp, $sp, -4    # Make space on stack
    sw      $ra, 0($sp)     # Save return address
         
    # Start test 1 
    ############################################################
    la      $a0, asize1     # 1st parameter: address of asize1[0]
    la      $a1, frame1     # 2nd parameter: address of frame1[0]
    la      $a2, window1    # 3rd parameter: address of window1[0] 
   
    jal     vbsme           # call function
  # jal     print_result    # print results to console
    
    ############################################################
    # End of test 1   
 
    # Start test 2 
    ############################################################
    la      $a0, asize2     # 1st parameter: address of asize2[0]
    la      $a1, frame2     # 2nd parameter: address of frame2[0]
    la      $a2, window2    # 3rd parameter: address of window2[0] 
   
    jal     vbsme           # call function
  # jal     print_result    # print results to console
    ############################################################
    # End of test 2   
                        
    # Start test 3
    ############################################################
    la      $a0, asize3     # 1st parameter: address of asize3[0]
    la      $a1, frame3     # 2nd parameter: address of frame3[0]
    la      $a2, window3    # 3rd parameter: address of window3[0] 

    jal     vbsme           # call function
  # jal     print_result    # print results to console 
    ############################################################
    # End of test 3       
      
    # Start test 4 
    ############################################################
    la      $a0, asize4     # 1st parameter: address of asize4[0]
    la      $a1, frame4     # 2nd parameter: address of frame4[0]
    la      $a2, window4    # 3rd parameter: address of window4[0] 

    jal     vbsme           # call function
  # jal     print_result    # print results to console
    ############################################################
    # End of test 4   
    
    # Start test 5
    ############################################################
    la      $a0, asize5     # 1st parameter: address of asize5[0]
    la      $a1, frame5     # 2nd parameter: address of frame5[0]
    la      $a2, window5    # 3rd parameter: address of window5[0] 

    jal     vbsme           # call function
 #  jal     print_result    # print results to console
    ############################################################
    # End of test 5

    lw      $ra, 0($sp)         # Restore return address
    addi    $sp, $sp, 4         # Restore stack pointer
    j       end_program         # Return

end_program:                    # remain in infinite loop
	j end_program
################### Print Result ####################################
#print_result:
    # Printing $v0
    # add     $a0, $v0, $zero     # Load $v0 for printing
    # li      $v0, 1              # Load the system call numbers
    # syscall
   
    # Print newline.
    # la      $a0, newline          # Load value for printing
    # li      $v0, 4                # Load the system call numbers
    # syscall
   
    # Printing $v1
    # add     $a0, $v1, $zero      # Load $v1 for printing
    # li      $v0, 1                # Load the system call numbers
    # syscall

    # Print newline.
    # la      $a0, newline          # Load value for printing
    # li      $v0, 4                # Load the system call numbers
    # syscall
   
    # Print newline.
    # la      $a0, newline          # Load value for printing
    # li      $v0, 4                # Load the system call numbers
    # syscall
   
    # jr      $ra                   #function return

#####################################################################
### vbsme
#####################################################################
.text
.globl  vbsme


vbsme:
    li      $v0, 0              # reset $v0 and $V1
    li      $v1, 0



    # insert your code here
   
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    add  $s0, $a1, $0 #s0 is current spot in array
    lw $s1, 0($a0)  #value of i, rows of frame(big)
    lw $s2, 4($a0)  #value of j, columns of frame
    lw $s3, 8($a0)  #value of k, rows of window(small)
    lw $s4, 12($a0) #value of l, columns of window

    sub  $t7, $s2, $s4 #find itterations till right edge, s4 for rows
    addi $t7, $t7, 1 #starts offset at 1

    addi $s6, $0, 2500 #set minimum above any value

    add  $t8, $0, $0 #offset of rows starts at 0
    addi  $t9, $0, 1 #offset of columns starts at 0

    j columnRight #begin search


    columnRightPre: #toDo write transitions from rowUp
    sub $t7, $s2, $s4 #find itterations till right edge
    add $t7, $t7, $t9 #add column offset

    beq $t7, $0, exit #if loops till edge is 0, then we are done

    sll $t0, $s2, 2 #multiply by 4 for word align
    add $s0, $s0, $t0 #move down extra row
    add $s0, $s0, 4 #move right 1

    addi $t9, $t9, -1 #increment column offset

    columnRight:
    beq $t7, $0, rowDownPre #when edge is hit start moving down

    #toDo SAD function
    #lw $t6, 0($s0) #print output
    jal SAD

    addi $s0, $s0, 4 #itterate spot by one column
    addi $t7, $t7, -1 #move one closer to edge
    j columnRight #loop
   
    
    rowDownPre:  #toDo write transitions from columnRight
    sub $s5, $s1, $s3 #find itterations till bottom edge
    add $s5, $s5, $t8 #add the row offset

    beq $s5, $0, exit #if loops till edge is 0, then we are done

    addi $s0, -4  #move back extra column
    sll, $t0, $s2, 2 #multiply by 4 for word allign
    add  $s0, $s0, $t0 #move down row

    addi $t8, $t8, -1 #increment offset value of row

    rowDown:
    beq $s5, $0 columnLeftPre

    #toDo SAD function
    #lw $t6, 0($s0) #print output
    jal SAD

    sll $t0, $s2, 2 #multiply by 4 for word allign
    add $s0, $s0, $t0 #move down a row
    addi $s5, $s5, -1 #move one closer to edge
    j rowDown #loop

    columnLeftPre: #t0Do write transitions from rowDown
    sub $t7, $s2, $s4 #find itterations till left edge
    add $t7, $t7, $t9 #add column offset
    
    beq $t7, $0, exit #if loops till edge is 0, then we are done

    sll $t0, $s2, 2 #multiply by 4 for word allign
    sub $s0, $s0, $t0 #move up extra row
    addi $s0, $s0, -4 #move left

    addi $t9, $t9, -1 #increment column offset

    columnLeft:
    beq $t7, $0, rowUpPre #change direction when edge hit

    #toDo SAD function
    #lw $t6, 0($s0) #print output
    jal SAD

    addi $s0, $s0, -4 #move left by one
    addi $t7, $t7, -1 #move one closer to edge

    j columnLeft #loop

    rowUpPre:
    sub $s5, $s1, $s3 #find itterations till top edge
    add $s5, $s5, $t8 #add row offset

    beq $s5, $0, exit #if loops till edge is 0, then we are done

    addi $s0, $s0, 4 #move right extra column
    sll  $t0, $s2, 2 #multiply by 4 for word align
    sub $s0, $s0, $t0 #move up a row

    addi $t8, $t8, -1 #increment row offset

    rowUp:
    beq $s5, $0, columnRightPre #change direction when edge hit

    #toDo SAD function
    #lw $t6, 0($s0) #print output
    jal SAD

    sll $t0, $s2, 2 #multiply by 4 for world align
    sub $s0, $s0, $t0 #move up a row
    addi $s5, $s5, -1 #move one closer to edge
    j rowUp #loop
    
    .text
    .globl SAD

    SAD: #SAD function
    
    add $t5, $a2, $0        # load top left window unto $t5
    add $t1, $s3, $0       # load k into t1 reg
    add $t4, $s0, $0       # load current addrerss into a temp var
    addi $t0, $zero, 0     # loading zero into the starting SAD sum
    # add $t5, $s5, $0       # load top left window adress into t5
Loop1:
    # slt $t0, $0, $t1        # t0 0 while t1(k) is greater that zero
    # beq $t0, $0, Here
    blez $t1, Here
    add $t2, $s4, $0       # load l into t2 reg
Loop2:
    # slt $t0, $0, $t2        # s0 0 while t2(l) is greater that zero
    # beq $t0, $0, Here2
    blez $t2, Here2
    # where I think Aidens code will go
    
diff:   
    # slt $t2, $t1, $a2      # this is the index
    # beq $t2, $zero, exit   # also index Patrick's code does this
    lw $t3, 0($t5)           # Patrick's code puts the window address as $t5  
    lw $t6, 0($t4)           # Patrick's code puts the frame address as $t4
    sub $t3, $t3, $t6        # subtrack window val and frame val
    bgez $t3, sum            # abs
    sub $t3, $zero, $t3      # abs

sum:    
    add $t0, $t0, $t3        # running sum
    # addi $s0, $s0, 4       # moving the window to the next value Patrick's code does this
    # addi $s1, $s1, 4       # moving the frame to the next value Patrick's code does this
    # addi $t1, $t1, 1       # indexing the count Patrick's code does this
    # j diff                 # continue to Patrick's code to calculate the adresses     




    # lw $t7, 0($t5)          # For testing
    addi $t4, $t4, 4        # moving the current address by 4 to get to the next number
    addi $t5, $t5, 4 
    addi $t2, $t2, -1       # subtracting l by one
    j Loop2                 # re looping loop2
Here2:                      # go here when loop2 is no longer valid
    sub $t3, $s2, $s4       # calculating the skip value to go to next line
    sll $t3, $t3, 2         # multiplying skip by 4
    add $t4, $t4, $t3       # skiping the address to the new line    
    # addi $t5, $t5, 4
    addi $t1, $t1, -1       # subtracting k by 1
    j Loop1                 # re looping loop1
    
Here:                       # go here when loop1 is no longer valid

    minimum:
    slt $t3, $t0, $s6
    bne $t3, $0, newMin
    j exitMin

    newMin:
    add $s6, $t0, $0
    add $s7, $s0, $0

    #exitMin:
    #jr      $ra

    #exit:
    sub $t1, $s7, $a1 #find index in array
    srl $t1, $t1, 2 #convert from word index

    addi $t2, $0, -1

    loop:
    slt $t3, $t1, $0 #is t1 < 0
    bne $t3, $0, colunnIndex #leave if so
    sub $t1, $t1, $s2 #increment row up
    addi $t2, $t2, 1 #increment row index
    j loop

    colunnIndex:
    add $t1, $t1, $s2 #increment row up
    
    add $v0, $0, $t2 #set row index
    add $v1, $0, $t1

    exitMin:
    jr      $ra
    exit:

    lw $ra, 0($sp)
    addi $sp, 4
    jr $ra
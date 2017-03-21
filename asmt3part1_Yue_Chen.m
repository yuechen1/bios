%list contains 62 values
%from 2 - 61, the values are x y z for that point
%1      person number
%2      number of frames of video
%3-5    Head
%6-8    Shoulder Center
%9-11   Shoulder Left
%12-14  Elbow Left
%15-17  Wrist Left
%18-20  Hand Left
%21-23  Shoulder Right
%24-26  Elbow Right
%27-29  Wrist Right
%30-32  Hand Right
%33-35  Spine
%36-38  Hip Center
%39-41  Hip Left
%42-44  Knee Left
%45-47  Ankle Left
%48-50  Foot Left
%51-53  Hip Right
%54-56  Knee Right
%57-59  Ankle Right
%60-62  Foot Right

trainning_data = dlmread('traindata_labeled.txt', ' ');
[m, n] = size(trainning_data);
person1 = zero(4, 20);

%loop through file for person 1, extract distance from all points to Hip
%Center
%column number for points are multiples of 3
for i = 1:4
    for j = 1:20
       person1(i,j) = eudistance(j*3, j*3+1, j*3+2, trainning_data(i,36), trainning_data(i,37), trainning_data(i,38));
    end
end
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

%open the file
fileID = fopen('traindata_labeled.txt', 'r');

%hold the extracted data for each person per video
dataset = cell(1,20);

%start with person one and loop through all 5
person_number = 1;
while person_number <= 5
    %for each person go through 4 videos
    video_number = 1;
    while video_number <= 4
        %get the frist two values
        person_frame = fscanf(fileID, '%d %d', 2);
        %make 2 tempary arrays
        currentset = zeros(1,person_frame(2));
        temparray = zeros(1,20);
        i = 1;
        %loop through all the frames of the video
        while i <= person_frame(2)
            %get data from file for one frame
            trainning_data = fscanf(fileID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 60);
            %get distance of each point to hip center
            for j = 1:20
                temparray(j) = eudistance(trainning_data(j*3-2), trainning_data(j*3-1), trainning_data(j*3), trainning_data(34),trainning_data(35),trainning_data(36));
            end
            %find the mean of the points
            currentset(i) = mean(temparray);
            i = i + 1;
        end
        %store the final set
        dataset{(person_number -1)*4+video_number} = currentset;
        video_number = video_number + 1;
    end
    person_number = person_number + 1;
end
%finish the trainning data set
fclose(fileID);

%open the unknown file
fileID = fopen('Test_data_unlabeled.txt', 'r');
%start the unlabled dataset
dataset_unknown = cell(1, 10);
video_number = 1;
while video_number <= 10
        %get the number of frames
        person_frame = fscanf(fileID, '%d', 1);
        %make 2 tempary arrays
        currentset = zeros(1,person_frame);
        temparray = zeros(1,20);
        i = 1;
        %loop through all the frames of the video
        while i <= person_frame
            %get data from file for one frame
            trainning_data = fscanf(fileID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 60);
            %get distance of each point to hip center
            for j = 1:20
                temparray(j) = eudistance(trainning_data(j*3-2), trainning_data(j*3-1), trainning_data(j*3), trainning_data(34),trainning_data(35),trainning_data(36));
            end
            %find the mean of the points
            currentset(i) = mean(temparray);
            i = i + 1;
        end
        %store the final set
        dataset_unknown{video_number} = currentset;
        video_number = video_number + 1;
end

finalset = zeros(10, 2);
for video_number = 1:1:10
    finalset(video_number, 2) = 100;
    for data = 1:1:20
        Asize = size(dataset_unknown{video_number});
        Bsize = size(dataset{data});
        temparray = zeros(Asize);
        for j = 1:1:min(Asize(2), Bsize(2))
            temparray(j) = abs(dataset_unknown{video_number}(j) - dataset{data}(j));
        end
        if mean(temparray) < finalset(video_number, 2)
            finalset(video_number, 2) = mean(temparray);
            finalset(video_number, 1) = ceil(data/4);
        end
    end
end


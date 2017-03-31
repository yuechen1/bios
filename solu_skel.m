clear;
tic()

% Reading input from train data file
f_train = fopen('train_data.txt','r');

% Initially empty matrix
train_seq = [];

for i = 1: 1: 20 % As 20 Video seq
    % Write your code here
    % Use fscanf (carefully read the documentation from internet)
    % Insert the training data into train_seq matrix (will be 5 column matrix)		
end

fclose(f_train);


% Generate features from train data for each video sequence

F_tr = []; % To store training features for all video seq

for i = 1: 1: 20 % As 20 Video seq
    
    % Select all data from train_seq with video sequence number == i
    
    % call distance_joint function 
    % [my_mean, my_std] = distance_joint(?,?,?);
    
    % insert into the F_tr 
end


% Reading input from test data file
f_test = fopen('test_data.txt','r');

% Initially empty matrix
test_seq = [];

for i = 1: 1: 10 % As 10 Video seq
    % Write your code here
    % Use fscanf (carefully read the documentation from internet)
    % Insert the testing data into test_seq matrix (will be 4 column matrix, as person # is not given)		
end

fclose(f_test);

% Generate features from test data for each sequence

F_te = []; % To store test features for all video seq

for i = 1: 1: 10 % As 10 test Video seq
    
    % Select all data from test_seq with video sequence number == i
    
    % call distance_joint function 
    % [my_mean, my_std] = distance_joint(?,?,?);
    
    % insert into the F_te 
end


% Matching between video sequences
for i = 1:1:10 % for each test feature vector
    %...
    %...
    P = 0; % best_match_person # (initially zero as default value);
    for j = 1:1:20 % for each training features vector
       % Calculate euclidean distance
       % Track the person no. P with minimum distance	
    end
    
    str = strcat('Sequence--',int2str(i),' is best matched with person--', int2str(P));
    disp(str);
end

toc()
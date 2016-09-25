function varargout = Suspect_Detection(varargin)
% SUSPECT_DETECTION MATLAB code for Suspect_Detection.fig
%      SUSPECT_DETECTION, by itself, creates a new SUSPECT_DETECTION or raises the existing
%      singleton*.
%
%      H = SUSPECT_DETECTION returns the handle to a new SUSPECT_DETECTION or the handle to
%      the existing singleton*.
%
%      SUSPECT_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUSPECT_DETECTION.M with the given input arguments.
%
%      SUSPECT_DETECTION('Property','Value',...) creates a new SUSPECT_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Suspect_Detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Suspect_Detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Suspect_Detection

% Last Modified by GUIDE v2.5 24-Sep-2016 00:07:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Suspect_Detection_OpeningFcn, ...
                   'gui_OutputFcn',  @Suspect_Detection_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Suspect_Detection is made visible.
function Suspect_Detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Suspect_Detection (see VARARGIN)

% Choose default command line output for Suspect_Detection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Suspect_Detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Suspect_Detection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Video_Browse_Button.
function Video_Browse_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Video_Browse_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[VideoFileName,VideoPathName] = uigetfile('*.avi','Select the video file');
set(handles.edit_video_path , 'string', [VideoPathName VideoFileName]);


% --- Executes on button press in Image_Browse_Button.
function Image_Browse_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Image_Browse_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[ImageFileName,ImagePathName] = uigetfile('*.png','Select the image file');
set(handles.edit_Image_Path , 'string', [ImagePathName ImageFileName]);



function edit_video_path_Callback(hObject, eventdata, handles)
% hObject    handle to edit_video_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_video_path as text
%        str2double(get(hObject,'String')) returns contents of edit_video_path as a double


% --- Executes during object creation, after setting all properties.
function edit_video_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_video_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Image_Path_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Image_Path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Image_Path as text
%        str2double(get(hObject,'String')) returns contents of edit_Image_Path as a double


% --- Executes during object creation, after setting all properties.
function edit_Image_Path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Image_Path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inFileName = get(handles.edit_video_path, 'String');
SD_Algorithm(inFileName)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h1 = figure('Name', 'Pattern Image', 'NumberTitle', 'off');
set(h1, 'Position', [200 300 300 300])
inFileName = get(handles.edit_Image_Path, 'String');
imshow(inFileName);

inFileName = get(handles.edit_video_path, 'String');
[pathstr, name, ext] = fileparts(inFileName);
inPath = [pathstr '\' name '\'];

h2 = figure('Name', 'Candidates', 'NumberTitle', 'off');
set(h2, 'Position', [600 300 300 300]);
fileList = dir([inPath '*.png']);
rows = size(fileList, 1);
for i = 1:rows
    inFileName = [inPath '\' fileList(i).name];
    imshow(inFileName);
end
close(h2);

h3 = figure('Name', 'Matched', 'NumberTitle', 'off');
set(h3, 'Position', [600 300 300 300]);

inPath = [inPath 'Final_Candidates\'];
fileList = dir([inPath '*.png']);
rows = size(fileList, 1);


similarity = [0.98 0.85 0.77 0.72 0.55 0.52 0.31 0.22 0.19 0.15];

for i = 1:rows
    subplot(2, 5, i);
    imshow([inPath fileList(i).name]);
    title(['s=' num2str(similarity(i))]);
end

function varargout = guimatlab(varargin)
% GUIMATLAB MATLAB code for guimatlab.fig
%      GUIMATLAB, by itself, creates a new GUIMATLAB or raises the existing
%      singleton*.
%
%      H = GUIMATLAB returns the handle to a new GUIMATLAB or the handle to
%      the existing singleton*.
%
%      GUIMATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMATLAB.M with the given input arguments.
%
%      GUIMATLAB('Property','Value',...) creates a new GUIMATLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guimatlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guimatlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guimatlab

% Last Modified by GUIDE v2.5 16-Nov-2021 01:23:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guimatlab_OpeningFcn, ...
                   'gui_OutputFcn',  @guimatlab_OutputFcn, ...
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


% --- Executes just before guimatlab is made visible.
function guimatlab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guimatlab (see VARARGIN)

% Choose default command line output for guimatlab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guimatlab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guimatlab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata,    handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*');
if ~isequal (filename,0)
    handles.data1 = imread(fullfile(pathname, filename));
    guidata(hObject,handles);
    axes(handles.axes1);
    imshow(handles.data1);
    title(filename);
else
    return;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imagegray = handles.data1;
gray = rgb2gray(imagegray);
axes (handles.axes2);
imshow(gray);
title('Citra Grayscale');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = handles.data1;
r = rot90(p(:,:,1),3);
g = rot90(p(:,:,2),3);
b = rot90(p(:,:,3),3);
putar = cat(3,r,g,b);
handles.data1 = putar;
guidata(hObject, handles);
axes(handles.axes2);
imshow(putar);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
foto = handles.data1;
nilai = get(handles.slider1,'Value');
cerah = foto + nilai;
axes(handles.axes2);
imshow(cerah);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
negatif = handles.data1;
hasil = negatif;
[m,n] = size(negatif);
for x = 1:m
    for y = 1:n
        hasil(x,y)= 255 - negatif (x,y);
    end
end
axes(handles.axes2);
imshow(hasil);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


set(handles.radiobutton1,'Value',1)
set(handles.radiobutton2,'Value',0)
 
Img = handles.data1;
Flip_Hor = fliplr(Img);
 
axes(handles.axes2)
cla('reset')
imshow(Flip_Hor)
 
handles.data1 = Flip_Hor;
guidata(hObject, handles)
 
% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',1)
 
Img = handles.data1;
Flip_Ver = flipud(Img);
 
axes(handles.axes2)
cla('reset')
imshow(Flip_Ver)
 
handles.data1 = Flip_Ver;
guidata(hObject, handles)


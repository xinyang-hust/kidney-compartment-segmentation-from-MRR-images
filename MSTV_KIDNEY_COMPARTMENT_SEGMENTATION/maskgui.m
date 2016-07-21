function varargout = maskgui(varargin)
% MASKGUI MATLAB code for maskgui.fig
%      MASKGUI, by itself, creates a new MASKGUI or raises the existing
%      singleton*.
%
%      H = MASKGUI returns the handle to a new MASKGUI or the handle to
%      the existing singleton*.
%
%      MASKGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MASKGUI.M with the given input arguments.
%
%      MASKGUI('Property','Value',...) creates a new MASKGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before maskgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to maskgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help maskgui

% Last Modified by GUIDE v2.5 21-Apr-2015 15:36:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @maskgui_OpeningFcn, ...
                   'gui_OutputFcn',  @maskgui_OutputFcn, ...
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


% --- Executes just before maskgui is made visible.
function maskgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to maskgui (see VARARGIN)

% Choose default command line output for maskgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global mask Num; %menue1 menue2 menue3; %factor1 factor2 factor3
   %factor1=1;
   %factor2=1;
   %factor3=1;
    %menue1=1;
    %menue2=1;
    %menue3=1;
[ start_slice,end_slice ] = startend( mask );
handles.mask=mask;guidata(hObject, handles);
axes(handles.fig1);imshow(mask(:,:,start_slice));
n_min=start_slice;
n_max=end_slice;
set(handles.slider1,'Min',n_min);
set(handles.slider1,'Max',n_max);
n_step=[1 1]/(n_max-n_min);
set(handles.slider1,'SliderStep',n_step);
set(handles.slider1,'Value',n_min);
set(handles.text1,'String',n_min);
%set global variables



% UIWAIT makes maskgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = maskgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
val=get(hObject,'Value');
set(handles.text1,'String',sprintf('%3.0f',val));
a=handles.mask;
val=round(val);
axes(handles.fig1);imshow(a(:,:,val));
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
maskPCandKmeans;
labelgui;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)s

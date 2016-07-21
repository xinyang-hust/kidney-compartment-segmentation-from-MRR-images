function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 11-Jul-2016 10:17:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%load('data');
%save('numt','Num','T');
%handles.Num=Num;guidata(hObject,handles);
%handles.T=T;guidata(hObject,handles);
%Num=handles.Num;

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% global count_num_seg;
% count_num_seg=0;

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
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
%a=handles.I;
global I ;

n=get(handles.slider2,'Value');
n=round(n);
axes(handles.fig1);imshow(imadjust(I{val}(:,:,1,n)));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
val=get(hObject,'Value');
set(handles.text2,'String',sprintf('%3.0f',val));

t=get(handles.slider1,'Value');
%a=handles.I;
global I T;
val=round(val);
axes(handles.fig1);imshow(imadjust(I{t}(:,:,1,val)));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)


MSERmain

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count_num_seg;
global Num T I info;
count_num_seg
count_num_seg=count_num_seg+1;
count_num_seg
if (count_num_seg==1)
[I,Num,T,info]=loaddicom;
end
axes(handles.fig1);imshow(imadjust(I{1}(:,:,1,1)));
t_min=1;
t_max=max(T);
set(handles.slider1,'Min',t_min);
set(handles.slider1,'Max',t_max);
t_step=[1 1]/(t_max-t_min);
set(handles.slider1,'SliderStep',t_step);
set(handles.slider1,'Value',t_min);
set(handles.text1,'String',1);

%------------------------------------------
n_min=1;
n_max=Num;
set(handles.slider2,'Min',n_min);
set(handles.slider2,'Max',n_max);
n_step=[1 1]/(n_max-n_min);
set(handles.slider2,'SliderStep',n_step);
set(handles.slider2,'Value',n_min);
set(handles.text2,'String',1);
%set global variables
handles.I=I;guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
timeimagegui;


% % --- Executes on button press in pushbutton4.
% function pushbutton4_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global rect_a I T ave_aorta aorta_roi aorta_t aorta_slice;
% axes(handles.fig1);
% h_a=imrect
% pos_a=wait(h_a);
% rect_a=int32(pos_a);
% aorta_t=get(handles.slider1,'Value');
% aorta_slice=get(handles.slider2,'Value');
% 
% for i=1:T
%     aorta_roi=imcrop(I{i}(:,:,1,aorta_slice),rect_a);
%     ave_aorta(i)=mean(aorta_roi(:));
% end

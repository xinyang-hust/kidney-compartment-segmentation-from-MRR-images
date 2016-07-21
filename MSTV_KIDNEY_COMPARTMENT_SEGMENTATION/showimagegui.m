function varargout = showimagegui(varargin)
% SHOWIMAGEGUI MATLAB code for showimagegui.fig
%      SHOWIMAGEGUI, by itself, creates a new SHOWIMAGEGUI or raises the existing
%      singleton*.
%
%      H = SHOWIMAGEGUI returns the handle to a new SHOWIMAGEGUI or the handle to
%      the existing singleton*.
%
%      SHOWIMAGEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOWIMAGEGUI.M with the given input arguments.
%
%      SHOWIMAGEGUI('Property','Value',...) creates a new SHOWIMAGEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before showimagegui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to showimagegui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help showimagegui

% Last Modified by GUIDE v2.5 28-May-2015 15:52:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @showimagegui_OpeningFcn, ...
                   'gui_OutputFcn',  @showimagegui_OutputFcn, ...
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


% --- Executes just before showimagegui is made visible.
function showimagegui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to showimagegui (see VARARGIN)

% Choose default command line output for showimagegui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes showimagegui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global r_cortex T Num;
[l,m,~]=size(r_cortex);
a=zeros(l,m);
axes(handles.fig1);imshow(a);

t_min=1;
t_max=max(T);
set(handles.sl1,'Min',t_min);
set(handles.sl1,'Max',t_max);
t_step=[1 1]/(t_max-t_min);
set(handles.sl1,'SliderStep',t_step);
set(handles.sl1,'Value',t_min);
set(handles.text1,'String',1);


n_min=1;
n_max=Num;
set(handles.sl2,'Min',n_min);
set(handles.sl2,'Max',n_max);
n_step=[1 1]/(n_max-n_min);
set(handles.sl2,'SliderStep',n_step);
set(handles.sl2,'Value',n_min);
set(handles.text2,'String',1);

% --- Outputs from this function are returned to the command line.
function varargout = showimagegui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sl1_Callback(hObject, eventdata, handles)
% hObject    handle to sl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global cropI r_cortex r_medulla r_collsy I T peaktime;
[peaktime]=timeimage(I,T);
val=get(hObject,'Value');val=fix(val);
set(handles.text1,'String',sprintf('%3.0f',val));
%a=handles.I;
n=get(handles.sl2,'Value');
n=round(n);

back=cropI{val}(:,:,1,n);
back=imadjust(back/max(max(back)));
% figure;imshow(back);
idx_c=find(r_cortex(:,:,n)==1);idx_m=find(r_medulla(:,:,n)==1);idx_p=find(r_collsy(:,:,n)==1);
r=back;g=back;b=back;
r(idx_c)=255;g(idx_c)=0;b(idx_c)=0;
r(idx_m)=0;g(idx_m)=255;b(idx_m)=0;
r(idx_p)=255;g(idx_p)=255;b(idx_p)=0;
rgb(:,:,1)=r;
rgb(:,:,2)=g;
rgb(:,:,3)=b;
axes(handles.fig1);imshow(rgb);
axes(handles.fig2);imshow(back);
%%%%%%%%%%%show timeimage
peakshow=peaktime(:,:,n)/max(max(peaktime(:,:,n)));
axes(handles.fig3);image(peakshow);


% --- Executes during object creation, after setting all properties.
function sl1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sl2_Callback(hObject, eventdata, handles)
% hObject    handle to sl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');
set(handles.text2,'String',sprintf('%3.0f',val));

t=get(handles.sl1,'Value');t=fix(t);
%a=handles.I;
global cropI r_cortex r_medulla r_collsy ;

val=round(val);val=fix(val);


back=cropI{t}(:,:,1,val);
back=imadjust(back/max(max(back)));
idx_c=find(r_cortex(:,:,val)==1);idx_m=find(r_medulla(:,:,val)==1);idx_p=find(r_collsy(:,:,val)==1);
r=back;g=back;b=back;
r(idx_c)=255;g(idx_c)=0;b(idx_c)=0;
r(idx_m)=0;g(idx_m)=255;b(idx_m)=0;
r(idx_p)=255;g(idx_p)=255;b(idx_p)=0;
rgb(:,:,1)=r;
rgb(:,:,2)=g;
rgb(:,:,3)=b;

axes(handles.fig1);imshow(rgb);
axes(handles.fig2);imshow(back);


% --- Executes during object creation, after setting all properties.
function sl2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% back=cropI{t}(:,:,1,n);
% im=r_cortex(:,:,n);
% idx=find(im==1);
% r=back;g=back;b=back;
% r(idx)=255;g(idx)=0;b(idx)=0;
% rgb(:,:,1)=r;
% rgb(:,:,2)=g;
% rgb(:,:,3)=b;
% imshow(rgb);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

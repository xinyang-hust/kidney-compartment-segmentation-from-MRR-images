function varargout = refinegui2(varargin)
% REFINEGUI2 MATLAB code for refinegui2.fig
%      REFINEGUI2, by itself, creates a new REFINEGUI2 or raises the existing
%      singleton*.
%
%      H = REFINEGUI2 returns the handle to a new REFINEGUI2 or the handle to
%      the existing singleton*.
%
%      REFINEGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REFINEGUI2.M with the given input arguments.
%
%      REFINEGUI2('Property','Value',...) creates a new REFINEGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before refinegui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to refinegui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help refinegui2

% Last Modified by GUIDE v2.5 24-May-2015 21:20:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @refinegui2_OpeningFcn, ...
                   'gui_OutputFcn',  @refinegui2_OutputFcn, ...
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


% --- Executes just before refinegui2 is made visible.
function refinegui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to refinegui2 (see VARARGIN)

% Choose default command line output for refinegui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes refinegui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global cortex medulla collsy Num cropI T;
global start_slice_c end_slice_c start_slice_m end_slice_m start_slice_s end_slice_s;
global r_cortex r_medulla r_collsy;
r_cortex =cortex;
r_medulla=medulla;
r_collsy=collsy;
axes(handles.fig2);imshow(cortex(:,:,start_slice_c));
axes(handles.fig4);imshow(medulla(:,:,start_slice_m));
axes(handles.fig6);imshow(collsy(:,:,start_slice_s));
axes(handles.fig1);averagecurve(cortex,cropI,T,Num,'-r');
ylabel('intensity');
xlabel('Temporal Point');
axes(handles.fig3);averagecurve(medulla,cropI,T,Num,'-r');
ylabel('intensity');
xlabel('Temporal Point');
axes(handles.fig5);averagecurve(collsy,cropI,T,Num,'-r');
ylabel('intensity');
xlabel('Temporal Point');
set(handles.slider1,'Min',start_slice_c);
set(handles.slider1,'Max',end_slice_c);

set(handles.slider2,'Min',start_slice_m);
set(handles.slider2,'Max',end_slice_m);

set(handles.slider3,'Min',start_slice_s);
set(handles.slider3,'Max',end_slice_s);

n_step1=[1 1]/(end_slice_c-start_slice_c);
n_step2=[1 1]/(end_slice_m-start_slice_m);
n_step3=[1 1]/(end_slice_s-start_slice_s);
set(handles.slider1,'SliderStep',n_step1);
set(handles.slider1,'Value',start_slice_c);
set(handles.text1,'String',start_slice_c);

set(handles.slider2,'SliderStep',n_step2);
set(handles.slider2,'Value',start_slice_m);
set(handles.text2,'String',start_slice_m);

set(handles.slider3,'SliderStep',n_step3);
set(handles.slider3,'Value',start_slice_s);
set(handles.text3,'String',start_slice_s);

set(handles.slider4,'Min',0.5);
set(handles.slider4,'Max',2.5);

set(handles.slider5,'Min',0.5);
set(handles.slider5,'Max',2.5);

set(handles.slider6,'Min',0.5);
set(handles.slider6,'Max',2.5);

n_step4=[0.05 0.05];
n_step5=[0.05 0.05];
n_step6=[0.05 0.05];
set(handles.slider4,'SliderStep',n_step4);
set(handles.slider4,'Value',1.0);
set(handles.text4,'String',1.0);

set(handles.slider5,'SliderStep',n_step5);
set(handles.slider5,'Value',0.5);
set(handles.text5,'String',0.5);

set(handles.slider6,'SliderStep',n_step6);
set(handles.slider6,'Value',2);
set(handles.text6,'String',2);

% --- Outputs from this function are returned to the command line.
function varargout = refinegui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global r_cortex;
val=get(hObject,'Value');
set(handles.text1,'String',sprintf('%3.0f',val));
val=round(val);
axes(handles.fig2);imshow(r_cortex(:,:,val));


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
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global r_medulla;
val=get(hObject,'Value');
set(handles.text2,'String',val);
val=round(val);
axes(handles.fig4);imshow(r_medulla(:,:,val));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global r_collsy;
val=get(hObject,'Value');
set(handles.text3,'String',val);
val=round(val);
axes(handles.fig6);imshow(r_collsy(:,:,val));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
factor_c=get(hObject,'Value');
set(handles.text4,'String',sprintf('%2.1f',factor_c));


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
factor_m=get(hObject,'Value');
set(handles.text5,'String',sprintf('%2.1f',factor_m));

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
factor_s=get(hObject,'Value');
set(handles.text6,'String',sprintf('%2.1f',factor_s));

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
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
global r_cortex cortex cropI T Num count_num_seg r_cortexs;
factor_c=get(handles.slider4,'Value');
[r_cortex]=cortexrefinement(cortex,factor_c);
val=get(handles.slider1,'Value');
%[start_slice_c,end_slice_c] = startend( r_cortex );
axes(handles.fig2);imshow(r_cortex(:,:,val));
axes(handles.fig1);averagecurve(r_cortex,cropI,T,Num,'-r');
r_cortexs{count_num_seg}=r_cortex;

%set(handles.slider1,'Min',start_slice_c);
%set(handles.slider1,'Max',end_slice_c);


%n_step1=[1 1]/(end_slice_c-start_slice_c);

%set(handles.slider1,'SliderStep',n_step1);
%set(handles.slider1,'Value',start_slice_c);
%set(handles.text1,'String',start_slice_c);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r_cortex medulla r_medulla cropI T Num count_num_seg r_medullas;
factor_m=get(handles.slider5,'Value');
[r_medulla]=medullarefinement(r_cortex,medulla,factor_m);
%[start_slice_m,end_slice_m] = startend( r_medulla );
val=get(handles.slider2,'Value');
axes(handles.fig4);imshow(r_medulla(:,:,val));
axes(handles.fig3);averagecurve(r_medulla,cropI,T,Num,'-r');
r_medullas{count_num_seg}=r_medulla;

%set(handles.slider2,'Min',start_slice_m);
% set(handles.slider2,'Max',end_slice_m);
% 
% 
% n_step2=[1 1]/(end_slice_m-start_slice_m);
% 
% set(handles.slider2,'SliderStep',n_step2);
% set(handles.slider2,'Value',start_slice_m);
% set(handles.text2,'String',start_slice_m);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global r_cortex r_medulla r_collsy cropI T Num count_num_seg r_collsys;
factor_s=get(handles.slider6,'Value');
[r_collsy]=collsyrefinement(r_cortex,r_medulla,factor_s);
%[start_slice_s,end_slice_s] = startend( r_collsy );
val=get(handles.slider3,'Value');
axes(handles.fig6);imshow(r_collsy(:,:,val));
axes(handles.fig5);averagecurve(r_collsy,cropI,T,Num,'-r');
r_collsys{count_num_seg}=r_collsy;


% set(handles.slider3,'Min',start_slice_s);
% set(handles.slider3,'Max',end_slice_s);
% 
% 
% n_step3=[1 1]/(end_slice_s-start_slice_s);
% 
% set(handles.slider3,'SliderStep',n_step3);
% set(handles.slider3,'Value',start_slice_s);
% set(handles.text3,'String',start_slice_s);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r_cortex r_medulla r_collsy;
area1=find(r_cortex==1);
area_c=size(area1);
area2=find(r_medulla==1);
area_m=size(area2);
area3=find(r_collsy==1);
area_s=size(area3);
HI=sprintf('HI=%4.3f',(area_c+area_m)/(area_c+area_m+area_s));
set(handles.text17,'String',HI);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r_cortex;
savegipl(r_cortex);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r_medulla;
savegipl(r_medulla);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r_collsy;
savegipl(r_collsy);


% --- Executes on button press in pushbutton8.
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
showimagegui;
select_timepoint;

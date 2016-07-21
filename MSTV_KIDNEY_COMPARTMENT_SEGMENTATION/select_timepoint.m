function varargout = select_timepoint(varargin)
% SELECT_TIMEPOINT MATLAB code for select_timepoint.fig
%      SELECT_TIMEPOINT, by itself, creates a new SELECT_TIMEPOINT or raises the existing
%      singleton*.
%
%      H = SELECT_TIMEPOINT returns the handle to a new SELECT_TIMEPOINT or the handle to
%      the existing singleton*.
%
%      SELECT_TIMEPOINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_TIMEPOINT.M with the given input arguments.
%
%      SELECT_TIMEPOINT('Property','Value',...) creates a new SELECT_TIMEPOINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_timepoint_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_timepoint_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_timepoint

% Last Modified by GUIDE v2.5 26-May-2015 16:58:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @select_timepoint_OpeningFcn, ...
                   'gui_OutputFcn',  @select_timepoint_OutputFcn, ...
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


% --- Executes just before select_timepoint is made visible.
function select_timepoint_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_timepoint (see VARARGIN)

% Choose default command line output for select_timepoint
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_timepoint wait for user response (see UIRESUME)
% uiwait(handles.figure1);

a=zeros(256,256);
axes(handles.fig1);imshow(a);
global count_num_seg kid_idx;
if (kid_idx{count_num_seg}==1)
    set(handles.text3,'String','right');
else
    set(handles.text3,'String','left');
end
axes(handles.fig2);
ylabel('intensity');
xlabel('Temporal Point');

% if (count_num_seg>1)
  set(handles.uipanel1,'Visible','on');
% end
% --- Outputs from this function are returned to the command line.
function varargout = select_timepoint_OutputFcn(hObject, eventdata, handles) 
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
val=get(hObject,'Value');val=fix(val);
set(handles.text1,'String',sprintf('%3.0f',val));
%a=handles.I;
global I;
n=get(handles.sl2,'Value');
n=round(n);
axes(handles.fig1);imshow(imadjust(I{val}(:,:,1,n)));

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
global I;
val=round(val);val=fix(val);
axes(handles.fig1);imshow(imadjust(I{t}(:,:,1,val)));


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
global I Num T info;
global thick wide;
thick=info.SliceThickness;
wide=info.PixelSpacing;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%show all images
axes(handles.fig1);imshow(imadjust(I{1}(:,:,1,1)));
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%show the first rgb compartments



function text1_Callback(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text1 as text
%        str2double(get(hObject,'String')) returns contents of text1 as a double


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text2_Callback(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text2 as text
%        str2double(get(hObject,'String')) returns contents of text2 as a double


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count_num_seg;global intensity1;
global initime initimes;
global I T ;

if (count_num_seg==1)
%ref_time
% for i=1:T
% Ir{i}=double(I{i});
% end
axes(handles.fig1);
sl=get(handles.sl2,'Value');

h=imrect;
pos=wait(h);
delete(h);
global aorta 
for i=1:max(T)
    aorta{i}=double(imcrop(I{i}(:,:,1,sl),pos));
end

[a,b]=size(aorta{1});

for i=1:max(T)
    intensity1(i)=sum(sum(aorta{i}))/(a*b);
end

initime=find(intensity1==max(intensity1));
initimes{count_num_seg}=initime;
%refreshdata(handles.fig2);
axes(handles.fig2);
plot(1:T,intensity1,'-r');hold on

else
    
    initimes{count_num_seg}=initimes{1};
    axes(handles.fig2);plot(1:T,intensity1,'-r');hold on
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  T 
%ref_time
% for i=1:T
% Ir{i}=double(I{i});
% end
axes(handles.fig1);
% [x,y]=ginput(1);
% x=round(x);
% y=round(y);
% t=get(handles.sl1);
% sl=get(handles.sl2,'Value');
% for i=1:T
%     intensity2(i)=Ir{i}(y(1),x(1),1,sl);
% end
global cropI r_collsys count_num_seg;
f=find(r_collsys{count_num_seg}~=0);
intensity_label=zeros(length(f),max(T));
for i=1:length(f)
    for j=1:max(T)
        intensity_label(i,j)=cropI{j}(f(i));
    end
end
intensity_label=double(intensity_label);
sort_label=sort(intensity_label,1,'descend');
[a,~]=size(sort_label);
intensity2=ones(1,max(T));
for i=1:max(T)
    intensity2(1,i)=sum(sort_label(1:a,i))/a;
end
% intensity2
% figure;;plot(1:T,intensity2,'-b');
axes(handles.fig2);plot(1:T,intensity2,'-b');hold on

global endtime1 endtime1s;
endtime1=find(intensity2==max(intensity2));
endtime1s{count_num_seg}=endtime1;



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count_num_seg;

global I T 
%ref_time
% for i=1:T
% Ir{i}=double(I{i});
% end
axes(handles.fig1);
sl=get(handles.sl2,'Value');

h=imrect;
pos=wait(h);
delete(h);
global  ureters
for i=1:max(T)
    ureters{count_num_seg}{i}=double(imcrop(I{i}(:,:,1,sl),pos));
end

[a,b]=size(ureters{count_num_seg}{1});
global intensity3;
for i=1:max(T)
    intensity3{count_num_seg}(i)=sum(sum(ureters{count_num_seg}{i}))/(a*b);
end
global endtime2 endtime2s;
endtime2=find(intensity3{count_num_seg}==max(intensity3{count_num_seg}));
endtime2s{count_num_seg}=endtime2;
%refreshdata(handles.fig2);
% if (count_num_seg==1)
axes(handles.fig2);plot(1:T,intensity3{count_num_seg},'-m');hold on
% else
%    axes(handles.fig2);plot(1:T,intensity3{count_num_seg},'-m*');hold on 
% end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  T 
%ref_time
% for i=1:T
% Ir{i}=double(I{i});
% end
% axes(handles.fig1);[x,y]=ginput(1);
% x=round(x);
% y=round(y);
% t=get(handles.sl1);
% sl=get(handles.sl2,'Value');
% for i=1:T
%     intensity4(i)=Ir{i}(y(1),x(1),1,sl);
% end
global count_num_seg r_cortexs r_medullas cropI endtime3s

% [l,m,n]=size(r_cortexs{count_num_seg});

parenchyma=or(r_cortexs{count_num_seg},r_medullas{count_num_seg});
f=find(parenchyma~=0);
intensity_label=zeros(length(f),max(T));
for i=1:length(f)
    for j=1:max(T)
        intensity_label(i,j)=cropI{j}(f(i));
    end
end
intensity_label=double(intensity_label);
sort_label=sort(intensity_label,1,'descend');
[a,~]=size(sort_label);
intensity4=ones(1,max(T));
for i=1:max(T)
    intensity4(1,i)=sum(sort_label(1:a,i))/a;
end
axes(handles.fig2);plot(1:T,intensity4,'-g');hold on
legend('arota','calyces','ureter','parenchymal');
global endtime3;
endtime3=find(intensity4==max(intensity4));
endtime3s{count_num_seg}=endtime3;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% report;
 option1=get(handles.radiobutton1,'Value');
 option2=get(handles.radiobutton2,'Value');
% option3=get(handles.radiobutton3,'Value');
% option4=get(handles.radiobutton4,'Value');
global count_num_seg;
if(count_num_seg==1)
    if (option1)
        gui;
    end
    if (option2)
        report;
    end
else
    report;
end
% if (option3)
%     report
% end
% if (option4)
%     report_all
% end
%     
%    
   


  


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global count_num_seg;
if (count_num_seg>1)
    set(hObject,'Visible','off');
end

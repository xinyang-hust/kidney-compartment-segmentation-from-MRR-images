function varargout = judgegui2(varargin)
% JUDGEGUI2 MATLAB code for judgegui2.fig
%      JUDGEGUI2, by itself, creates a new JUDGEGUI2 or raises the existing
%      singleton*.
%
%      H = JUDGEGUI2 returns the handle to a new JUDGEGUI2 or the handle to
%      the existing singleton*.
%
%      JUDGEGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JUDGEGUI2.M with the given input arguments.
%
%      JUDGEGUI2('Property','Value',...) creates a new JUDGEGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before judgegui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to judgegui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help judgegui2

% Last Modified by GUIDE v2.5 25-May-2015 16:50:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @judgegui2_OpeningFcn, ...
                   'gui_OutputFcn',  @judgegui2_OutputFcn, ...
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


% --- Executes just before judgegui2 is made visible.
function judgegui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to judgegui2 (see VARARGIN)

% Choose default command line output for judgegui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global Label1 Label2 Label3 Num cropI T start_slice1;
global end_slice1 start_slice2 end_slice2 start_slice3 end_slice3; 
global r_Label1 r_Label2 r_Label3;
r_Label1=Label1;
r_Label2=Label2;
r_Label3=Label3;
axes(handles.fig2);imshow(Label1(:,:,start_slice1));
axes(handles.fig4);imshow(Label2(:,:,start_slice2));
axes(handles.fig6);imshow(Label3(:,:,start_slice3));
axes(handles.fig1);averagecurve(Label1,cropI,T,Num,'-r');
axes(handles.fig3);averagecurve(Label2,cropI,T,Num,'-r');
axes(handles.fig5);averagecurve(Label3,cropI,T,Num,'-r');

set(handles.slider1,'Min',start_slice1);
set(handles.slider1,'Max',end_slice1);

set(handles.slider2,'Min',start_slice2);
set(handles.slider2,'Max',end_slice2);

set(handles.slider3,'Min',start_slice3);
set(handles.slider3,'Max',end_slice3);

n_step1=[1 1]/(end_slice1-start_slice1);
n_step2=[1 1]/(end_slice2-start_slice2);
n_step3=[1 1]/(end_slice3-start_slice3);
set(handles.slider1,'SliderStep',n_step1);
set(handles.slider1,'Value',start_slice1);
set(handles.text1,'String',start_slice1);

set(handles.slider2,'SliderStep',n_step2);
set(handles.slider2,'Value',start_slice2);
set(handles.text2,'String',start_slice2);

set(handles.slider3,'SliderStep',n_step3);
set(handles.slider3,'Value',start_slice3);
set(handles.text3,'String',start_slice3);

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
set(handles.slider4,'Value',0.5);
set(handles.text4,'String',0.5);

set(handles.slider5,'SliderStep',n_step5);
set(handles.slider5,'Value',0.5);
set(handles.text5,'String',0.5);

set(handles.slider6,'SliderStep',n_step6);
set(handles.slider6,'Value',0.5);
set(handles.text6,'String',0.5);
% UIWAIT makes judgegui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = judgegui2_OutputFcn(hObject, eventdata, handles) 
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
global r_Label1;
val=get(hObject,'Value');
set(handles.text1,'String',sprintf('%2.0f',val));
val=round(val);
axes(handles.fig2);imshow(r_Label1(:,:,val));

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
global r_Label2;
val=get(hObject,'Value');
set(handles.text2,'String',val);
val=round(val);
axes(handles.fig4);imshow(r_Label2(:,:,val));

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
global r_Label3;
val=get(hObject,'Value');
set(handles.text3,'String',val);
val=round(val);
axes(handles.fig6);imshow(r_Label3(:,:,val));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
factor_1=get(hObject,'Value');
set(handles.text4,'String',sprintf('%2.1f',factor_1));

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
factor_2=get(hObject,'Value');
set(handles.text5,'String',sprintf('%2.1f',factor_2));

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
factor_3=get(hObject,'Value');
set(handles.text6,'String',sprintf('%2.1f',factor_3));

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
global Label1 r_Label1 r_cortex r_medulla r_collsy cropI T Num;
val1=get(handles.popupmenu1,'Value');
factor_1=get(handles.slider4,'Value');
switch val1
    case 1
        [r_cortex]=cortexrefinement(Label1,factor_1);
        r_Label1=r_cortex;
        val=get(handles.slider1,'Value');
        axes(handles.fig1);averagecurve(r_cortex,cropI,T,Num,'-r');
        %[start_slice_c,end_slice_c] = startend( r_cortex );
        axes(handles.fig2);imshow(r_cortex(:,:,val));
%         set(handles.slider1,'Min',start_slice_c);
%         set(handles.slider1,'Max',end_slice_c);
%         n_step1=[1 1]/(end_slice_c-start_slice_c);
%         set(handles.slider1,'SliderStep',n_step1);
%         set(handles.slider1,'Value',start_slice_c);
%         set(handles.text1,'String',start_slice_c);
    case 2
        [r_medulla]=medullarefinement(r_cortex,Label1,factor_1); 
        r_Label1=r_medulla;
        val=get(handles.slider1,'Value');
        axes(handles.fig1);averagecurve(r_medulla,cropI,T,Num,'-r');
        %[start_slice_m,end_slice_m] = startend( r_medulla );
        axes(handles.fig2);imshow(r_medulla(:,:,val));
%         set(handles.slider1,'Min',start_slice_m);
%         set(handles.slider1,'Max',end_slice_m);
%         n_step1=[1 1]/(end_slice_m-start_slice_m);
%         set(handles.slider1,'SliderStep',n_step1);
%         set(handles.slider1,'Value',start_slice_m);
%         set(handles.text1,'String',start_slice_m);
    case 3
        [r_collsy]=collsyrefinement(r_cortex,r_medulla,factor_1);
         r_Label1=r_collsy; 
         val=get(handles.slider1,'Value');
        axes(handles.fig1);averagecurve(r_collsy,cropI,T,Num,'-r');
        %[start_slice_s,end_slice_s] = startend( r_collsy );
        axes(handles.fig2);imshow(r_collsy(:,:,val));
%         set(handles.slider1,'Min',start_slice_s);
%         set(handles.slider1,'Max',end_slice_s);
%         n_step1=[1 1]/(end_slice_s-start_slice_s);
%         set(handles.slider1,'SliderStep',n_step1);
%         set(handles.slider1,'Value',start_slice_s);
%         set(handles.text1,'String',start_slice_s);
end
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Label2 r_Label2 r_cortex r_medulla r_collsy cropI T Num;
val2=get(handles.popupmenu2,'Value');
factor_2=get(handles.slider5,'Value');
switch val2
    case 1
        [r_cortex]=cortexrefinement(Label2,factor_2);
        r_Label2=r_cortex;
         val=get(handles.slider2,'Value');
        axes(handles.fig3);averagecurve(r_cortex,cropI,T,Num,'-r');
        %[start_slice_c,end_slice_c] = startend( r_cortex );
        axes(handles.fig4);imshow(r_cortex(:,:,val));
%         set(handles.slider2,'Min',start_slice_c);
%         set(handles.slider2,'Max',end_slice_c);
%         n_step2=[1 1]/(end_slice_c-start_slice_c);
%         set(handles.slider2,'SliderStep',n_step2);
%         set(handles.slider2,'Value',start_slice_c);
%         set(handles.text2,'String',start_slice_c);
    case 2
        [r_medulla]=medullarefinement(r_cortex,Label2,factor_2); 
        r_Label2=r_medulla;
         val=get(handles.slider2,'Value');
        axes(handles.fig3);averagecurve(r_medulla,cropI,T,Num,'-r');
        %[start_slice_m,end_slice_m] = startend( r_medulla );
        axes(handles.fig4);imshow(r_medulla(:,:,val));
%         set(handles.slider2,'Min',start_slice_m);
%         set(handles.slider2,'Max',end_slice_m);
%         n_step2=[1 1]/(end_slice_m-start_slice_m);
%         set(handles.slider2,'SliderStep',n_step2);
%         set(handles.slider2,'Value',start_slice_m);
%         set(handles.text2,'String',start_slice_m);
    case 3
        [r_collsy]=collsyrefinement(r_cortex,r_medulla,factor_2);
        r_Label2=r_collsy;
        val=get(handles.slider2,'Value');
        axes(handles.fig3);averagecurve(r_collsy,cropI,T,Num,'-r');
        %[start_slice_s,end_slice_s] = startend( r_collsy );
        axes(handles.fig4);imshow(r_collsy(:,:,val));
%         set(handles.slider2,'Min',start_slice_s);
%         set(handles.slider2,'Max',end_slice_s);
%         n_step2=[1 1]/(end_slice_s-start_slice_s);
%         set(handles.slider2,'SliderStep',n_step2);
%         set(handles.slider2,'Value',start_slice_s);
%         set(handles.text2,'String',start_slice_s);
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Label3 r_Label3 r_cortex r_medulla r_collsy cropI T Num r_cortexs r_medullas r_collsys count_num_seg;
val3=get(handles.popupmenu3,'Value');
factor_3=get(handles.slider6,'Value');
switch val3
    case 1
        [r_cortex]=cortexrefinement(Label3,factor_3);
        r_Label3=r_cortex;
        val=get(handles.slider3,'Value');
        axes(handles.fig5);averagecurve(r_cortex,cropI,T,Num,'-r');
        %[start_slice_c,end_slice_c] = startend( r_cortex );
        axes(handles.fig6);imshow(r_cortex(:,:,val));
%         set(handles.slider3,'Min',start_slice_c);
%         set(handles.slider3,'Max',end_slice_c);
%         n_step3=[1 1]/(end_slice_c-start_slice_c);
%         set(handles.slider3,'SliderStep',n_step3);
%         set(handles.slider3,'Value',start_slice_c);
%         set(handles.text3,'String',start_slice_c);
    case 2
        [r_medulla]=medullarefinement(r_cortex,Label3,factor_3); 
        r_Label3=r_medulla;
        val=get(handles.slider3,'Value');
        axes(handles.fig5);averagecurve(r_medulla,cropI,T,Num,'-r');
        %[start_slice_m,end_slice_m] = startend( r_medulla );
        axes(handles.fig6);imshow(r_medulla(:,:,val));
%         set(handles.slider3,'Min',start_slice_m);
%         set(handles.slider3,'Max',end_slice_m);
%         n_step3=[1 1]/(end_slice_m-start_slice_m);
%         set(handles.slider3,'SliderStep',n_step3);
%         set(handles.slider3,'Value',start_slice_m);
%         set(handles.text3,'String',start_slice_m);
    case 3
        [r_collsy]=collsyrefinement(r_cortex,r_medulla,factor_3);
         r_Label3=r_collsy;
         val=get(handles.slider3,'Value');
         axes(handles.fig5);averagecurve(r_collsy,cropI,T,Num,'-r');
       % [start_slice_s,end_slice_s] = startend( r_collsy );
        axes(handles.fig6);imshow(r_collsy(:,:,val));
%         set(handles.slider3,'Min',start_slice_s);
%         set(handles.slider3,'Max',end_slice_s);
%         n_step3=[1 1]/(end_slice_s-start_slice_s);
%         set(handles.slider3,'SliderStep',n_step3);
%         set(handles.slider3,'Value',start_slice_s);
%         set(handles.text3,'String',start_slice_s);
        end
r_cortexs{count_num_seg}=r_cortex;
r_medullas{count_num_seg}=r_medulla;
r_collsys{count_num_seg}=r_collsy;
  % --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
 % hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global r_cortex ;
 savegipl(r_cortex);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r_medulla ;
savegipl(r_medulla);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r_collsy ;
savegipl(r_collsy);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
select_timepoint;

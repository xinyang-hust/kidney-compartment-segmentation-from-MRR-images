function varargout = labelgui(varargin)
% LABELGUI MATLAB code for labelgui.fig
%      LABELGUI, by itself, creates a new LABELGUI or raises the existing
%      singleton*.
%
%      H = LABELGUI returns the handle to a new LABELGUI or the handle to
%      the existing singleton*.
%
%      LABELGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LABELGUI.M with the given input arguments.
%
%      LABELGUI('Property','Value',...) creates a new LABELGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before labelgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to labelgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help labelgui

% Last Modified by GUIDE v2.5 26-May-2015 16:32:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @labelgui_OpeningFcn, ...
                   'gui_OutputFcn',  @labelgui_OutputFcn, ...
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


% --- Executes just before labelgui is made visible.
function labelgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to labelgui (see VARARGIN)

% Choose default command line output for labelgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%load('label');
%load('numt');
global Label1 Label2 Label3 Num cropI T start_slice1 end_slice1 start_slice2 end_slice2 start_slice3 end_slice3;
[ start_slice1,end_slice1 ] = startend( Label1 );
[ start_slice2,end_slice2 ] = startend( Label2 );
[ start_slice3,end_slice3 ] = startend( Label3 );
handles.Label1=Label1;guidata(hObject, handles);
handles.Label2=Label2;guidata(hObject, handles);
handles.Label3=Label3;guidata(hObject, handles);
axes(handles.fig1);imshow(Label1(:,:,start_slice1));
axes(handles.fig2);imshow(Label2(:,:,start_slice2));
axes(handles.fig3);imshow(Label3(:,:,start_slice3));
axes(handles.fig4);averagecurve(Label1,cropI,T,Num,'-r');
ylabel('intensity');
xlabel('Temporal Point');
axes(handles.fig5);averagecurve(Label2,cropI,T,Num,'-r');
ylabel('intensity');
xlabel('Temporal Point');
axes(handles.fig6);averagecurve(Label3,cropI,T,Num,'-r');
ylabel('intensity');
xlabel('Temporal Point');

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
global f_min f_medulla f_cortex ;
global start_slice_c end_slice_c start_slice_m end_slice_m start_slice_s end_slice_s;
global cortex medulla collsy;
str1=sprintf('Label%d is Cortex',f_cortex);
evalc(sprintf('cortex=Label%d',f_cortex));
% size(cortex)
evalc(sprintf('start_slice_c=start_slice%d',f_cortex));
evalc(sprintf('end_slice_c=end_slice%d',f_cortex));
str2=sprintf('Label%d is Medulla',f_medulla);
evalc(sprintf('medulla=Label%d',f_medulla));
evalc(sprintf('start_slice_m=start_slice%d',f_medulla));
evalc(sprintf('end_slice_m=end_slice%d',f_medulla));
str3=sprintf('Label%d is Pelvis',f_min);
evalc(sprintf('collsy=Label%d',f_min));
evalc(sprintf('start_slice_s=start_slice%d',f_min));
evalc(sprintf('end_slice_s=end_slice%d',f_min));

str={str1,str2,str3};
set(handles.text9,'String',str);

% UIWAIT makes labelgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%set global variables
% --- Outputs from this function are returned to the command line.
function varargout = labelgui_OutputFcn(hObject, eventdata, handles) 
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
val=get(hObject,'Value');
set(handles.text1,'String',sprintf('%2.0f',val));
a=handles.Label1;
val=round(val);
axes(handles.fig1);imshow(a(:,:,val));

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
val=get(hObject,'Value');
set(handles.text2,'String',sprintf('%2.0f',val));
a=handles.Label2;
val=round(val);
axes(handles.fig2);imshow(a(:,:,val));

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
val=get(hObject,'Value');
set(handles.text3,'String',sprintf('%2.0f',val));
a=handles.Label3;
val=round(val);
axes(handles.fig3);imshow(a(:,:,val));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
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
option=get(handles.radiobutton1,'Value');
if (option)
   
   refinegui2;
else

   judgegui2;
  
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
maskPCandKmeans;
labelgui;

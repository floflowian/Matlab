function varargout = GUI_utilisateur(varargin)
% GUI_UTILISATEUR MATLAB code for GUI_utilisateur.fig
%      GUI_UTILISATEUR, by itself, creates a new GUI_UTILISATEUR or raises the existing
%      singleton*.
%
%      H = GUI_UTILISATEUR returns the handle to a new GUI_UTILISATEUR or the handle to
%      the existing singleton*.
%
%      GUI_UTILISATEUR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_UTILISATEUR.M with the given input arguments.
%
%      GUI_UTILISATEUR('Property','Value',...) creates a new GUI_UTILISATEUR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_utilisateur_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_utilisateur_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_utilisateur

% Last Modified by GUIDE v2.5 30-Dec-2013 11:40:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_utilisateur_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_utilisateur_OutputFcn, ...
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


% --- Executes just before GUI_utilisateur is made visible.
function GUI_utilisateur_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_utilisateur (see VARARGIN)
rectangle('Position',[1,2,5,10],'Curvature',[0.2,0.4],...
          'FaceColor',[0.039, 0.69, 0.94],'Clipping','off');
      axis([]);
global logo
logo=handles.axes1;
global image
image=imread('rds_logo.png');
axes(logo);
imshow(image, []);
global info_rds
info_rds=cell(18);
SNR=varargin{1}
[info_rds,error]=main(SNR);

if error ~=0
    set(handles.text4,'String','NO RDS');
    set(handles.text3,'String','NO RDS');
    set(handles.text5,'String','NO RDS');
else
if info_rds{1,3}==1
    set(handles.text8,'FontWeight','Bold');
end
if info_rds{1,2}==1
    set(handles.text7,'FontWeight','Bold');
end
if strcmp(info_rds{1,1},'Undefined')==0
    set(handles.text6,'FontWeight','Bold');
end
if info_rds{1,4}(1)~=0
    set(handles.text9,'FontWeight','Bold');
end
set(handles.text3,'String',strcat(num2str(info_rds{1,4}(2)),' MHz'));
set(handles.text5,'String',strcat(num2str(info_rds{1,9}),'/',num2str(info_rds{1,8}),'/',num2str(info_rds{1,7}),'  -  ',num2str(info_rds{1,10}),':',num2str(info_rds{1,11})));

string_display_cell=strcat({num2str(info_rds{1,5})},{num2str(info_rds{1,1})},{' '},{num2str(info_rds{1,6})},{' '},{num2str(info_rds{1,12})},{' '},{num2str(info_rds{1,5})});
string_display=string_display_cell{1};
for i=1:length(string_display)-7
    set(handles.text4,'String',string_display(i:i+6));
    pause(0.75);
end
end
% Choose default command line output for GUI_utilisateur
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_utilisateur wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_utilisateur_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

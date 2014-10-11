function varargout = GUI_technique(varargin)
% GUI_TECHNIQUE MATLAB code for GUI_technique.fig
%      GUI_TECHNIQUE, by itself, creates a new GUI_TECHNIQUE or raises the existing
%      singleton*.
%
%      H = GUI_TECHNIQUE returns the handle to a new GUI_TECHNIQUE or the handle to
%      the existing singleton*.
%
%      GUI_TECHNIQUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TECHNIQUE.M with the given input arguments.
%
%      GUI_TECHNIQUE('Property','Value',...) creates a new GUI_TECHNIQUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_technique_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_technique_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_technique

% Last Modified by GUIDE v2.5 30-Dec-2013 19:10:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_technique_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_technique_OutputFcn, ...
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


% --- Executes just before GUI_technique is made visible.
function GUI_technique_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_technique (see VARARGIN)
global info_rds
global logo
logo=handles.axes1;
global image
image=imread('rds_logo.png');
axes(logo);
imshow(image, []);
info_rds=cell(20);

SNR=varargin{1}
[info_rds,error]=main(SNR);
if error~=0
    set(handles.text3,'String','NO RDS');
set(handles.text5,'String','NO RDS');
set(handles.text33,'String','NO RDS');
set(handles.text18,'String','NO RDS');
set(handles.text19,'String','NO RDS');
set(handles.text20,'String','NO RDS');
set(handles.text21,'String','NO RDS');
set(handles.text22,'String','NO RDS');
set(handles.text23,'String','NO RDS');
set(handles.text24,'String','NO RDS');
set(handles.text29,'String','NO RDS');
set(handles.text30,'String','NO RDS');
set(handles.text31,'String','NO RDS');
set(handles.text32,'String','NO RDS');
set(handles.text12,'String','NO RDS');
set(handles.text13,'String','NO RDS');
set(handles.text14,'String','NO RDS');
set(handles.text15,'String','NO RDS');
set(handles.text7,'String','NO RDS');
else
    
set(handles.text3,'String',strcat(num2str(info_rds{1,17}),'s'));
set(handles.text5,'String',info_rds{1,18});
set(handles.text33,'String',info_rds{1,4}(1));
set(handles.text18,'String',strcat(num2str(info_rds{1,4}(2)),' MHz'));
set(handles.text19,'String',strcat(num2str(info_rds{1,4}(3)),' MHz'));
set(handles.text20,'String',strcat(num2str(info_rds{1,4}(4)),' MHz'));
set(handles.text21,'String',strcat(num2str(info_rds{1,4}(5)),' MHz'));
set(handles.text22,'String',strcat(num2str(info_rds{1,4}(6)),' MHz'));
set(handles.text23,'String',strcat(num2str(info_rds{1,4}(7)),' MHz'));
set(handles.text24,'String',strcat(num2str(info_rds{1,4}(8)),' MHz'));
set(handles.text29,'String',strcat(num2str(info_rds{1,13}*100,2),'%'));
set(handles.text30,'String',strcat(num2str(info_rds{1,14}*100,2),'%'));
set(handles.text31,'String',strcat(num2str(info_rds{1,15}*100,2),'%'));
set(handles.text32,'String',strcat(num2str(info_rds{1,16}*100,2),'%'));
set(handles.text12,'String',info_rds{1,5});
set(handles.text13,'String',info_rds{1,3});
set(handles.text14,'String',info_rds{1,2});
set(handles.text15,'String',info_rds{1,19});
set(handles.text7,'String',num2str(info_rds{1,20}));
end
% Choose default command line output for GUI_technique
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_technique wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_technique_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

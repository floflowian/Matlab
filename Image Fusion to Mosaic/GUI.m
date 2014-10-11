function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
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
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 26-Dec-2013 17:39:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)
global image
global thumbnail
global nombre_image
global result
image=cell(1,12);
thumbnail=cell(1,12);
thumbnail{1,1}=handles.axes2;thumbnail{1,2}=handles.axes3;thumbnail{1,3}=handles.axes4;thumbnail{1,4}=handles.axes5;thumbnail{1,5}=handles.axes6;
result=handles.axes1;
nombre_image=0;
% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global nombre_image
global image
global result
if nombre_image~=0
image_sortie=mosaique(nombre_image,image{1,1},image{1,2},image{1,3},image{1,4},image{1,5});
axes(result);
imshow(image_sortie, []);
else
     errordlg('Aucune image à fusionner','Bad Input','modal');

end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global nombre_image
global image
global thumbnail
[file,path] = uigetfile({'*.bmp';'*.jpg'},'File Selector');
chemin_absolu=[path file];
if file~=0
    if nombre_image+1<=5
    nombre_image=nombre_image+1;
    image{1,nombre_image}=imread(chemin_absolu);
    axes(thumbnail{1,nombre_image});
    imshow(image{1,nombre_image}, []);
    
    else
        errordlg('Vous avez déjà 5 images','Bad Input','modal');
    end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global nombre_image
global image
global thumbnail
blank_image=255*ones(500,500);

if nombre_image-1>=0
    
    axes(thumbnail{1,nombre_image});
    imshow(blank_image, []);
    nombre_image=nombre_image-1;
end

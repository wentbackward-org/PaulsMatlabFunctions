function varargout = LoanCalculator(varargin)
% LOANCALCULATOR MATLAB code for LoanCalculator.fig
%      LOANCALCULATOR, by itself, creates a new LOANCALCULATOR or raises the existing
%      singleton*.
%
%      H = LOANCALCULATOR returns the handle to a new LOANCALCULATOR or the handle to
%      the existing singleton*.
%
%      LOANCALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOANCALCULATOR.M with the given input arguments.
%
%      LOANCALCULATOR('Property','Value',...) creates a new LOANCALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LoanCalculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LoanCalculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LoanCalculator

% Last Modified by GUIDE v2.5 24-Jul-2016 10:43:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LoanCalculator_OpeningFcn, ...
                   'gui_OutputFcn',  @LoanCalculator_OutputFcn, ...
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


% --- Executes just before LoanCalculator is made visible.
function LoanCalculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LoanCalculator (see VARARGIN)

% Choose default command line output for LoanCalculator
handles.output = hObject;

handles.pv = 100000;
handles.I = 2.57;
handles.n = 300;
set(handles.pv_edit,'String', '100,000');
set(handles.I_edit,'String', '2.57');
set(handles.n_edit,'String', '300');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LoanCalculator wait for user response (see UIRESUME)
% uiwait(handles.ui);


% --- Outputs from this function are returned to the command line.
function varargout = LoanCalculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in go_button.
function go_button_Callback(hObject, eventdata, handles)
% hObject    handle to go_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[schedule, payment, interest, total] = PaymentSchedule(handles.pv, handles.I, handles.n);
set(handles.pmt_text, 'String', sprintf('%16.2f',payment));
set(handles.total_text, 'String', sprintf('%16.2f',total));
set(handles.interest_text, 'String', sprintf('%16.2f',interest));
% Fill in the grid
set(handles.schedule_table,'Data', schedule);
% plot the principal vs interest portion
axes(handles.axes1);
periods = schedule(:,1);
plot(periods, schedule(:,5),'b',periods,schedule(:,3),'g',periods,schedule(:,4),'r');
legend('Balance','Principal','Interest','Location','north');
legend('show');

function pv_edit_Callback(hObject, eventdata, handles)
handles.pv = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pv_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pv_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function I_edit_Callback(hObject, eventdata, handles)
handles.I = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function I_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to I_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function n_edit_Callback(hObject, eventdata, handles)
handles.n = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function n_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

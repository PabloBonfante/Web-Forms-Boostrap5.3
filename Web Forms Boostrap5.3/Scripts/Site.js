// Codigo que se ejecuta en cada request
$(document).ready(function () {
    autoFocus();

    // Suscribirse al evento endRequest
    if (typeof Sys !== 'undefined') {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function EndRequestHandler(sender, args) {
            // Este código se ejecuta después de que se completa la solicitud AJAX
            autoFocus();
        }
    }
});

function openModal(selector, selectorFocus = '') {
    const modal = document.querySelector(selector);
    if (!modal) return;

    const bsModal = bootstrap.Modal.getOrCreateInstance(modal);
    if (!bsModal) return;

    bsModal.show();

    if (selectorFocus !== '') {
        modal.addEventListener('shown.bs.modal', () => {
            autoFocus(`${selector} ${selectorFocus}`);
        });
    }
}

function closeModal(selector) {
    const modal = document.querySelector(selector);
    if (!modal) return;

    const bsModal = bootstrap.Modal.getOrCreateInstance(modal);
    if (!bsModal) return;

    bsModal.hide();
}

function autoFocus(selectorFocus = '[autofocus], .autofocus')
{
    const focusElement = document.querySelector(selectorFocus);
    if (!focusElement) return;

    focusElement.focus();

    // Si es input o textarea, mover cursor al final del texto
    if (focusElement.tagName === 'INPUT' || focusElement.tagName === 'TEXTAREA') {
        const length = focusElement.value.length;
        focusElement.setSelectionRange(length, length);
    }
}

function createBootstrapToast({ headerText = '', bodyText = '', color = 'danger', icon = 'bi bi-exclamation-triangle' }) {
    // Crear el contenedor del Toast
    var toastContainer = document.createElement('div');
    toastContainer.className = 'toast-container position-fixed bottom-0 end-0 p-3';
    toastContainer.style = 'z-index: 1200;';

    // Crear el elemento del Toast
    var toastElement = document.createElement('div');
    toastElement.id = 'liveToast';
    toastElement.className = 'toast';
    toastElement.setAttribute('role', 'alert');
    toastElement.setAttribute('aria-live', 'assertive');
    toastElement.setAttribute('aria-atomic', 'true');

    // Crear el encabezado del Toast
    var toastHeader = document.createElement('div');
    toastHeader.className = `${icon} toast-header text-white bg-${color}`;

    var strongElement = document.createElement('strong');
    strongElement.className = 'me-auto';
    strongElement.innerHTML = `<b>&nbsp ${headerText}</b>`;

    var closeButton = document.createElement('button');
    closeButton.type = 'button';
    closeButton.className = 'btn-close btn-close-white';
    closeButton.setAttribute('data-bs-dismiss', 'toast');
    closeButton.setAttribute('aria-label', 'Close');

    toastHeader.appendChild(strongElement);
    toastHeader.appendChild(closeButton);

    // Crear el cuerpo del Toast
    var toastBody = document.createElement('div');
    toastBody.className = 'toast-body';
    toastBody.innerHTML = `<b>${bodyText}</b>`;

    // Agregar el encabezado y el cuerpo al Toast
    toastElement.appendChild(toastHeader);
    toastElement.appendChild(toastBody);

    // Agregar el Toast al contenedor
    toastContainer.appendChild(toastElement);

    // Agregar el contenedor al cuerpo del documento
    document.body.appendChild(toastContainer);

    // Mostrar el Toast
    const myToastEl = document.getElementById('liveToast');
    const toastInstance = new bootstrap.Toast(myToastEl);
    toastInstance.show();

    myToastEl.addEventListener('hidden.bs.toast', () => {
        myToastEl.remove();
    }, { once: true });
}

function createBootstrapToastSimple({ bodyText = '', color = 'danger', icon = 'bi bi-exclamation-triangle' }) {
    // Crea el elemento div con sus clases y atributos
    var toastContainer = document.createElement('div');
    toastContainer.id = 'SimpleToast';
    toastContainer.className = `toast position-fixed bottom-0 end-0 m-2 bg-${color}`;
    toastContainer.setAttribute('role', 'alert');
    toastContainer.setAttribute('aria-live', 'assertive');
    toastContainer.setAttribute('aria-atomic', 'true');
    toastContainer.style = 'z-index: 1200;';

    // Crea el elemento div interno con la clase "d-flex"
    var flexContainer = document.createElement('div');
    flexContainer.className = 'd-flex';

    // Crea el elemento con el mensaje del toast
    var toastBody = document.createElement('div');
    toastBody.className = `toast-body ${icon}`;
    toastBody.innerHTML = `<b>&nbsp ${bodyText}</b>`;

    // Crea el botón de cierre del toast
    var closeButton = document.createElement('button');
    closeButton.type = 'button';
    closeButton.className = 'btn-close btn-close-white me-2 m-auto';
    closeButton.setAttribute('data-bs-dismiss', 'toast');
    closeButton.setAttribute('aria-label', 'Close');

    // Agrega el elemento del mensaje y el botón al contenedor flex
    flexContainer.appendChild(toastBody);
    flexContainer.appendChild(closeButton);

    // Agrega el contenedor flex al contenedor principal
    toastContainer.appendChild(flexContainer);

    // Agrega el toast al cuerpo del documento
    document.body.appendChild(toastContainer);

    // Mostrar el Toast
    const myToastEl = document.getElementById('SimpleToast');
    const toastInstance = new bootstrap.Toast(myToastEl);
    toastInstance.show();

    myToastEl.addEventListener('hidden.bs.toast', () => {
        myToastEl.remove();
    }, { once: true });
}

function createBootstrapAlert({ headerText = '', bodyText = '', color = 'danger', icon = 'bi bi-exclamation-triangle', timeout = 5000 }) {

    // Crea el contenedor de la alerta
    var alertDiv = document.createElement('div');
    alertDiv.id = 'bootstrapAlert';
    alertDiv.className = `alert alert-${color} fixed-alert alert-dismissible fade show mb-0`;
    alertDiv.role = 'alert';
    alertDiv.style = 'z-index: 1200;';

    // Crea el encabezado de la alerta
    var alertHeader = document.createElement('h4');
    alertHeader.className = `alert-heading ${icon} i-mr-3`;
    alertHeader.innerHTML = headerText;

    // Crea el párrafo del mensaje
    var alertMessage = document.createElement('p');
    alertMessage.className = 'mb-0';
    alertMessage.innerHTML = bodyText;

    // Crea el botón de cierre
    var closeButton = document.createElement('button');
    closeButton.type = 'button';
    closeButton.className = 'btn-close';
    closeButton.setAttribute('data-bs-dismiss', 'alert');
    closeButton.setAttribute('aria-label', 'Cerrar alerta');

    // Agrega los elementos creados al contenedor de la alerta
    alertDiv.appendChild(alertHeader);
    alertDiv.appendChild(alertMessage);
    alertDiv.appendChild(closeButton);

    // Agrega el contenedor de la alerta al cuerpo del documento
    document.body.appendChild(alertDiv);

    // Elimina la alerta después de 5 segundos
    console.log(timeout);
    setTimeout(removeBootstrapAlert, timeout);
}

function removeBootstrapAlert() {
    var alertElement = document.getElementById('bootstrapAlert');
    if (alertElement) {
        // Usa el método de Bootstrap para cerrar la alerta
        var alertInstance = bootstrap.Alert.getOrCreateInstance(alertElement);
        alertInstance.close();

        // Escucha el evento 'closed.bs.alert' que se dispara después de que la alerta se cierra
        alertElement.addEventListener('closed.bs.alert', function () {
            alertElement.remove();
        }, { once: true });
    }
}

function areYouSure({ event, headerText = '¿Estás seguro?', bodyText = 'Una vez eliminado, no podrás recuperar la información.', ValidationGroup = '', ShowWorking = '' }) {
    if (event === undefined || event === '') 
        return false;

    const btn = event.target;

    if (!btn) 
        return false;

    // Si requiere que valide y NO pasa la validacion retorno false
    if (ValidationGroup !== undefined && ValidationGroup !== '' && !Page_ClientValidate(ValidationGroup))
        return false;
    
    if (btn.hasAttribute('data-ok-confirm')) {
        closeConfirmModal();
        // Pregunta si quiere que muestre el modal de ShowWorking
        if (ShowWorking !== undefined && ShowWorking !== '')
            showWorking(true, ShowWorkingText);

        return true; // Retorna true fin del proceso
    } else {
        event.preventDefault(); // Prevenir el postback
        Btn_Disabled_Enabled_CSS({ selector: btn }); // Deshabilitar el botón llamador
        createConfirmModal({ btn, headerText, bodyText }); // Creo el modal
    }

    return false; // Retorna 'false' porque es la primera vez que entra (para evitar que el boton se ejecute junto con el preventDefault())
}

function createConfirmModal({ btn, headerText, bodyText }) {

    // Crear elementos del modal
    const modalDiv = document.createElement('div');
    modalDiv.className = 'modal fade';
    modalDiv.id = 'ConfirmModal';
    modalDiv.tabIndex = '-1';
    modalDiv.setAttribute('role', 'dialog');
    modalDiv.setAttribute('aria-labelledby', 'ConfirmModalLabel');
    modalDiv.setAttribute('aria-hidden', 'true');
    modalDiv.setAttribute('data-bs-backdrop', 'static');
    modalDiv.setAttribute('data-bs-keyboard', 'false');

    const modalDialog = document.createElement('div');
    modalDialog.className = 'modal-dialog';
    modalDialog.setAttribute('role', 'document');

    const modalContent = document.createElement('div');
    modalContent.className = 'modal-content rounded-3 shadow';

    const modalBody = document.createElement('div');
    modalBody.className = 'modal-body p-4 text-center';

    const modalTitle = document.createElement('h5');
    modalTitle.className = 'mb-0';
    modalTitle.textContent = headerText;

    const modalText = document.createElement('p');
    modalText.className = 'mb-0';
    modalText.textContent = bodyText;

    modalBody.appendChild(modalTitle);
    modalBody.appendChild(modalText);

    const modalFooter = document.createElement('div');
    modalFooter.className = 'modal-footer flex-nowrap p-0';

    const yesButton = document.createElement('button');
    yesButton.type = 'button';
    yesButton.className = 'btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end';
    yesButton.innerHTML = '<strong>Aceptar</strong>';
    yesButton.setAttribute('onclick', `OKConfirm('${btn.id}');`);

    const noButton = document.createElement('button');
    noButton.type = 'button';
    noButton.className = 'btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0';
    noButton.textContent = 'Cancelar';
    noButton.setAttribute('data-bs-dismiss', 'modal');
    noButton.setAttribute('onclick', `closeConfirmModal('${btn.id}');`);

    modalFooter.appendChild(yesButton);
    modalFooter.appendChild(noButton);

    modalContent.appendChild(modalBody);
    modalContent.appendChild(modalFooter);

    modalDialog.appendChild(modalContent);

    modalDiv.appendChild(modalDialog);

    // Añadir el modal al cuerpo del documento
    document.body.appendChild(modalDiv);

    // Mostrar el modal
    var myModal = new bootstrap.Modal(modalDiv);
    myModal.show();
}

function OKConfirm(btnId) {
    const btn = document.getElementById(btnId);

    if (btn) {
        //Habilitar el botón llamador
        Btn_Disabled_Enabled_CSS({ selector: '#' + btn.id, disabled: false });

        // Agregar el atributo 'data-OK-Confirm'
        btn.setAttribute('data-ok-confirm', 'true');

        // Hacer clic en el botón
        btn.click();
    } else {
        console.error('El botón no existe');
    }
}

function closeConfirmModal(btn) {
    const modal = document.querySelector('#ConfirmModal');
    if (!modal) return;

    const bsModal = bootstrap.Modal.getOrCreateInstance(modal);
    if (!bsModal) return;

    bsModal.hide();
    modal.remove();

    if (btn) 
        Btn_Disabled_Enabled_CSS({ selector: '#' + btn, disabled: false });
}

function Btn_Disabled_Enabled_CSS({ selector, disabled = true }) {
    selector = (typeof selector === 'object') ? selector : document.querySelector(selector);
    if (selector) {
        selector.disabled = disabled;
        if (disabled) {
            selector.classList.add('aspNetDisabled');
        } else {
            selector.classList.remove('aspNetDisabled');
        }
    }
}

async function downloadCSV(url, fileName = 'file') {
    try {
        const response = await fetch(url);

        if (!response.ok) {
            throw new Error('Error en la descarga');
        }

        const blob = await response.blob();
        const link = document.createElement('a');
        const objectUrl = URL.createObjectURL(blob);

        link.href = objectUrl;
        link.download = fileName + ".csv";
        link.click();

        URL.revokeObjectURL(objectUrl);

        createBootstrapToastSimple({ bodyText: 'Descarga finalizada', color: 'success', icon: 'bi bi-check2-circle' });
    } catch (error) {
        alert('Error al descargar: ' + error.message);
    }
}
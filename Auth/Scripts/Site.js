function btnToggleLoading({ selector, busyText = null, disabled = true }) {
    var btn = (typeof selector === 'object')
        ? selector
        : document.querySelector(selector);

    if (!btn) {
        console.warn('Elemento no encontrado', selector);
        return;
    }

    var esInput = btn.tagName === 'INPUT';

    if (disabled) {
        btn.classList.add('aspNetDisabled');
        btn.setAttribute('aria-disabled', 'true');
        btn.setAttribute('aria-busy', 'true');

        if (busyText) {
            if (esInput) {
                btn.setAttribute('data-original-text', btn.value);
                btn.value = busyText;
            } else {
                btn.setAttribute('data-original-text', btn.innerHTML);
                btn.textContent = busyText;
            }
        }
    } else {
        btn.classList.remove('aspNetDisabled');
        btn.removeAttribute('aria-disabled');
        btn.removeAttribute('aria-busy');

        if (busyText && btn.getAttribute('data-original-text')) {
            if (esInput) {
                btn.value = btn.getAttribute('data-original-text') || btn.value;
            } else {
                btn.innerHTML = btn.getAttribute('data-original-text') || btn.innerHTML;
            }
            btn.removeAttribute('data-original-text');
        }
    }
}

function onGlobalEnter(callback) {
    document.addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            event.stopPropagation();
            callback(event);
        }
    });
}

function click(selector) {
    var element = (typeof selector === 'object')
        ? selector
        : document.querySelector(selector);

    if (!element) {
        console.warn('Elemento no encontrado', selector);
        return;
    }

    element.click();
}
/**
 * commentStore.js
 * Utilidad para guardar y leer objetos serializados en comentarios HTML.
 *
 * Formato del comentario:
 *   <!-- #miId: {"foo":"bar"} -->
 *
 * Uso:
 *   CommentStore.save('config', { tema: 'oscuro' });
 *   const cfg = CommentStore.load('config');
 *   CommentStore.remove('config');
 */
const CommentStore = (() => {
    // Escapa secuencias que romperían el comentario HTML
    const escapeForComment = (str) =>
        str.replace(/-->/g, '--\\>').replace(/--!>/g, '--!\\>');

    // Revierte el escape al leer
    const unescapeFromComment = (str) =>
        str.replace(/--\\>/g, '-->').replace(/--!\\>/g, '--!>');

    // Construye la regex para un ID dado
    const buildRegex = (id) => {
        const safeId = id.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // escapa meta
        return new RegExp(`^\\s*#${safeId}\\s*:\\s*([\\s\\S]*?)\\s*$`);
    };

    // Recorre todos los nodos comentario del DOM
    const walkComments = (root = document) => {
        const walker = document.createTreeWalker(
            root,
            NodeFilter.SHOW_COMMENT,
            null
        );
        const nodos = [];
        let nodo;
        while ((nodo = walker.nextNode())) nodos.push(nodo);
        return nodos;
    };

    // Encuentra el nodo comentario asociado a un ID
    const findCommentNode = (id, root = document) => {
        const regex = buildRegex(id);
        for (const nodo of walkComments(root)) {
            if (regex.test(nodo.nodeValue)) return nodo;
        }
        return null;
    };

    /**
     * Serializa un objeto y lo guarda en un comentario HTML.
     * Si ya existe un comentario con ese ID, lo actualiza.
     * @param {string} id  - Identificador (sin '#')
     * @param {*} valor    - Cualquier valor serializable a JSON
     * @param {object} [opts]
     * @param {Node}   [opts.root]       - Nodo raíz donde buscar/insertar (default: document.body)
     * @param {boolean}[opts.overwrite]  - Si false, lanza error si ya existe (default: true)
     * @returns {Comment} El nodo comentario creado/actualizado
     */
    const save = (id, valor, opts = {}) => {
        const { root = document.body, overwrite = true } = opts;

        if (!root || !root.appendChild) {
            throw new Error('CommentStore.save: root inválido');
        }

        const json = escapeForComment(JSON.stringify(valor));
        const contenido = ` #${id}: ${json} `;
        const existente = findCommentNode(id, root);

        if (existente) {
            if (!overwrite) {
                throw new Error(`CommentStore.save: ya existe un comentario con id "${id}"`);
            }
            existente.nodeValue = contenido;
            return existente;
        }

        const nodo = document.createComment(contenido);
        root.appendChild(nodo);
        return nodo;
    };

    /**
     * Deserializa el objeto guardado en el comentario con ese ID.
     * @param {string} id
     * @param {object} [opts]
     * @param {Node}   [opts.root]
     * @param {*}      [opts.fallback] - Valor a devolver si no existe o falla el parseo
     * @param {boolean}[opts.throwOnError] - Si true, propaga errores de JSON.parse (default: false)
     * @returns {*} El objeto deserializado o el fallback
     */
    const load = (id, opts = {}) => {
        const { root = document, fallback = null, throwOnError = false } = opts;

        const nodo = findCommentNode(id, root);
        if (!nodo) return fallback;

        const match = nodo.nodeValue.match(buildRegex(id));
        if (!match) return fallback;

        try {
            return JSON.parse(unescapeFromComment(match[1].trim()));
        } catch (err) {
            if (throwOnError) throw err;
            console.warn(`CommentStore.load: JSON inválido en comentario "#${id}"`, err);
            return fallback;
        }
    };

    /**
     * Comprueba si existe un comentario con ese ID.
     * @param {string} id
     * @param {Node}   [root]
     * @returns {boolean}
     */
    const has = (id, root = document) => findCommentNode(id, root) !== null;

    /**
     * Elimina el comentario con ese ID.
     * @param {string} id
     * @param {Node}   [root]
     * @returns {boolean} true si se eliminó algo
     */
    const remove = (id, root = document) => {
        const nodo = findCommentNode(id, root);
        if (!nodo) return false;
        nodo.parentNode.removeChild(nodo);
        return true;
    };

    /**
     * Devuelve un objeto con TODOS los comentarios con formato "#id: {...}".
     * @param {Node} [root]
     * @returns {Object.<string, *>}
     */
    const loadAll = (root = document) => {
        const regex = /^\s*#([\w.-]+)\s*:\s*([\s\S]*?)\s*$/;
        const resultado = {};

        for (const nodo of walkComments(root)) {
            const match = nodo.nodeValue.match(regex);
            if (!match) continue;
            const [, id, raw] = match;
            try {
                resultado[id] = JSON.parse(unescapeFromComment(raw.trim()));
            } catch {
                // comentario con formato válido pero JSON inválido → se ignora
            }
        }
        return resultado;
    };

    /**
     * Devuelve el nodo comentario (útil si quieres inspeccionarlo).
     * @param {string} id
     * @param {Node} [root]
     * @returns {Comment|null}
     */
    const getNode = (id, root = document) => findCommentNode(id, root);

    return { save, load, has, remove, loadAll, getNode };
})();

// Para módulos ES: export default CommentStore;
// Para CommonJS:    module.exports = CommentStore;
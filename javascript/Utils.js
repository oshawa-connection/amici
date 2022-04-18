/**
 * 
 * @param {string} id 
 */
export function getDomElementByIdNonNullable(id) {
    const element = document.getElementById(id);
    if (element === null) {
        throw new Error(`Element with id ${id} not found.`);
    }
    return element;
}

/**
 * 
 * @param {number} distanceMetres 
 * @returns 
 */
export function formatMetersDistance(distanceMetres) {
    return `${Math.round(distanceMetres/1000)} Km away`;
}
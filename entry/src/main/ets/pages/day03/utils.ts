export  function deepCopy<T>(obj: T): T {
  if (obj === null || typeof obj!== 'object') {
    return obj;
  }

  let copy: T;

  if (Array.isArray(obj)) {
    copy = [] as T;
    for (let i = 0; i < (obj as any[]).length; i++) {
      (copy as any[])[i] = deepCopy((obj as any[])[i]);
    }
  } else {
    copy = {} as T;
    for (const key in obj) {
      if (Object.prototype.hasOwnProperty.call(obj, key)) {
        (copy as { [key: string]: any })[key] = deepCopy((obj as { [key: string]: any })[key]);
      }
    }
  }

  return copy;
}
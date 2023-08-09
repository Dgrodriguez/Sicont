<!DOCTYPE html>
<html>
<head>
    <title>Generar Excel en el navegador</title>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/file-saver@2.0.5/dist/FileSaver.min.js"></script>
</head>
<body>
    <button onclick="generarExcel()">Generar Excel</button>

    <script>
        function generarExcel() {
            var workbook = XLSX.utils.book_new();
            var sheetData = [
                ['Proveedor', 'Descripción', 'Unidad'],
                ['Proveedor 1', 'Descripción 1', 'Unidad 1'],
                ['Proveedor 2', 'Descripción 2', 'Unidad 2'],
                ['Proveedor 3', 'Descripción 3', 'Unidad 3']
            ];
            var worksheet = XLSX.utils.aoa_to_sheet(sheetData);
            XLSX.utils.book_append_sheet(workbook, worksheet, 'Hoja1');

            var workbookOutput = XLSX.write(workbook, { type: 'binary' });
            var blob = new Blob([s2ab(workbookOutput)], { type: 'application/octet-stream' });
            saveAs(blob, 'archivo.xlsx');
        }

        function s2ab(s) {
            var buf = new ArrayBuffer(s.length);
            var view = new Uint8Array(buf);
            for (var i = 0; i < s.length; i++) {
                view[i] = s.charCodeAt(i) & 0xFF;
            }
            return buf;
        }
    </script>
</body>
</html>

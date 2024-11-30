import React, { useEffect, useState } from 'react';
import axios from 'axios';
import dayjs from 'dayjs';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableRow,
  Paper,
  Button,
  TextField,
  Box,
  Typography,
  Modal,
} from '@mui/material';
import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';
import Autocomplete from '@mui/material/Autocomplete';
import { DemoContainer } from '@mui/x-date-pickers/internals/demo';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';

const TablaGA = () => {
  const [datos, setDatos] = useState([]);
  const [tipos, setTipos] = useState([]);
  const [tiposIds, setTiposIds] = useState([]);

  useEffect(() => {
    // Function to fetch data from the API when the component mounts
    const fetchData = async () => {
      try {
        const response = await axios.get('https://savarciberespe-production.up.railway.app/api/activos');
        // Assuming the response data is an array, you can set it to the 'datos' state
        setDatos(response.data);
      } catch (error) {
        console.error('Error fetching data:', error)
      }
    };

    // Call the fetchData function when the component mounts
    fetchData();
  }, []);
  useEffect(() => {
    // Function to fetch data from the API when the component mounts
    const fetchData = async () => {
      try {
        const response = await axios.get('https://savarciberespe-production.up.railway.app/api/tiposactivos');
        // Assuming the response data is an array, you can set it to the 'datos' state
        setTipos(response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    // Call the fetchData function when the component mounts
    fetchData();
  }, []);

  // Update tiposIds state after tipos has been updated
  useEffect(() => {
    const tiposIds1 = tipos.map((item) => item.TAC_CODIGO);
    setTiposIds(tiposIds1);
  }, [tipos]);


  const [formulario, setFormulario] = useState({
    Tipo: '',
    FechaInicio: '',
    Identificacion: '',
    Nombre: '',
    Descripción: '',
    Observacion: '',
    Valor: '',
    FechaInactividad: null,
  });

  const [modalOpen, setModalOpen] = useState(false);
  const [busqueda, setBusqueda] = useState('');

  const [modificarIndex, setModificarIndex] = useState(-1);

  const handleBusquedaChange = (event) => {
    setBusqueda(event.target.value);
  };

  const handleDateChange = (newValue) => {
    // Format the date using dayjs before updating the state
    const formattedDate = dayjs(newValue).format('YYYY-MM-DD');
    console.log(formattedDate);
    setFormulario({
      ...formulario,
      FechaInicio: formattedDate,
    });
  };

  const handleInsert = () => {
    setModificarIndex(-1);
    setFormulario({
      Tipo: '',
      FechaInicio: '',
      Identificacion: '',
      Nombre: '',
      Descripción: '',
      Observacion: '',
      Valor: '',
      FechaInactividad: null,
    });
    setModalOpen(true);
  };

  const handleFormChange = (event) => {
    setFormulario({
      ...formulario,
      [event.target.name]: event.target.value,
    });
  };

  const handleGuardar = async () => {
    if (modificarIndex !== -1) {
      // Modificar el dato existente en la posición 'modificarIndex'
      await axios.put(`https://savarciberespe-production.up.railway.app/api/activos/${modificarIndex}`, formulario);
      // Now update the 'datos' state with the updated data
      const response = await axios.get('https://savarciberespe-production.up.railway.app/api/activos');
      setDatos(response.data);
    } else {
      await axios.post('https://savarciberespe-production.up.railway.app/api/activos', formulario);
      // Now fetch the updated data and update the 'datos' state
      const response = await axios.get('https://savarciberespe-production.up.railway.app/api/activos');
      setDatos(response.data);
    }

    setModalOpen(false);
    setFormulario({
      Tipo: '',
      FechaInicio: '',
      Identificacion: '',
      Nombre: '',
      Descripción: '',
      Observacion: '',
      Valor: '',
      FechaInactividad: null,
    });
  };

  const handleCancelar = () => {
    setModalOpen(false);
    setFormulario({
      Tipo: '',
      FechaInicio: '',
      Identificacion: '',
      Nombre: '',
      Descripción: '',
      Observacion: '',
      Valor: '',
      FechaInactividad: null,
    });
  };
  const handleFechaInactividadChange = (newValue) => {
    // Format the date using dayjs before updating the state
    const formattedDate = dayjs(newValue).format('YYYY-MM-DD');
    setFormulario({
      ...formulario,
      FechaInactividad: formattedDate,
    });
  };

  const handleModificar = (index) => {
    const formattedFechaInicio = dayjs(datos[index].ACT_FECHA_INICIO).format('YYYY-MM-DD');
    const formattedFechaInactividad = dayjs(datos[index].ACT_FECHA_INACTIVIDAD).format('YYYY-MM-DD'); // Format as 'YYYY-MM-DD HH:MM:SS'

    setModificarIndex(datos[index].ACT_CODIGO);
    setFormulario({
      Tipo: datos[index].TAC_CODIGO,
      FechaInicio: formattedFechaInicio,
      Identificacion: datos[index].ACT_IDENTIFICACION,
      Nombre: datos[index].ACT_NOMBRE,
      Descripción: datos[index].ACT_DESCRIPCION,
      Observacion: datos[index].ACT_OBSERVACION,
      Valor: datos[index].ACT_VALOR,
      FechaInactividad: formattedFechaInactividad, // Use the properly formatted date
    });
    setModalOpen(true);
  };


  const handleEliminar = async (index) => {
    const codigoToDelete = datos[index].TAC_CODIGO;

    // Make the DELETE request to delete the data
    await axios.delete(`https://savarciberespe-production.up.railway.app/api/activos/${codigoToDelete}`);

    // Fetch the updated data after the deletion
    const response = await axios.get('https://savarciberespe-production.up.railway.app/api/activos');
    setDatos(response.data);

    // Close the modal and reset the form
    setModalOpen(false);
    setFormulario({
      Tipo: '',
      FechaInicio: '',
      Identificacion: '',
      Nombre: '',
      Descripción: '',
      Observacion: '',
      Valor: '',
      FechaInactividad: null,
    });
  };
  return (
    <Box>
      <Box sx={{ border: 'none', p: 4 }}>
        <TableContainer component={Paper}>
          <Table sx={{ width: '100%', margin: '20px 10px 10px 10px', borderCollapse: 'collapse', border: '1px solid #ddd' }}>
            <TableBody>
              <TableRow>
                <TableCell colSpan={3} align="left">
                  <Button variant="contained" color="primary" onClick={handleInsert}>
                    Insertar Nuevo
                  </Button>
                </TableCell>

                <TableCell colSpan={3} align="right">
                  <TextField label="Buscar" variant="outlined" value={busqueda} onChange={handleBusquedaChange} />
                </TableCell>
              </TableRow>

              <TableRow>
                <TableCell colSpan={2} align="center">
                  Código
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Tipo
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Fecha de Inicio
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Identificacion
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Nombre
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Descripción
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Observacion
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Valor
                </TableCell>
                <TableCell colSpan={2} align="center">
                  Fecha de Inactividad
                </TableCell>
                <TableCell colSpan={4} align="center">
                  Opciones
                </TableCell>
              </TableRow>

              {/* Mapear los datos y renderizar las filas */}
              {datos.map((dato, index) => (
                <TableRow key={index}>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_CODIGO}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.TAC_CODIGO}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_FECHA_INICIO.split('T')[0]}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_IDENTIFICACION}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_NOMBRE}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_DESCRIPCION}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_OBSERVACION}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_VALOR}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    {dato.ACT_FECHA_INACTIVIDAD ? dato.ACT_FECHA_INACTIVIDAD.split('T')[0] : dato.ACT_FECHA_INACTIVIDAD}
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    <Button variant="contained" color="primary" onClick={() => handleModificar(index)}>
                      <EditIcon />
                    </Button>
                  </TableCell>
                  <TableCell colSpan={2} align="center">
                    <Button variant="contained" color="secondary" onClick={() => handleEliminar(index)} sx={{ backgroundColor: 'red' }}>
                      <DeleteIcon />
                    </Button>
                  </TableCell>
                </TableRow>
              ))}

              <TableRow>
                <TableCell colSpan={3} align="left">
                  Total de datos ingresados: {datos.length}
                </TableCell>
              </TableRow>
            </TableBody>
          </Table>
        </TableContainer>
      </Box>

      {/* Ventana emergente */}
      <Modal open={modalOpen} onClose={() => setModalOpen(false)}>
        <Box
          sx={{
            position: 'absolute',
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            bgcolor: 'background.paper',
            boxShadow: 24,
            p: 4,
            minWidth: 300,
            maxWidth: 500,
          }}
        >
          <Typography variant="h6" gutterBottom paddingBottom={1}>
            {modificarIndex !== -1 ? 'Modificar Elemento' : 'Nuevo Elemento'}
          </Typography>
          <Autocomplete
            disablePortal
            id="combo-box-demo"
            name="Tipo"
            value={formulario.Tipo}
            options={tipos.map((tipo) => tipo.TAC_DESCRIPCION)}
            sx={{ width: 300 }}
            onChange={(event, newValue) => {
              const selectedTipo = tipos.find((tipo) => tipo.TAC_DESCRIPCION === newValue);
              setFormulario({
                ...formulario,
                TipoId: selectedTipo ? selectedTipo.TAC_CODIGO : '',
                Tipo: newValue, // Update the selected value when an option is selected
              });
            }}
            renderInput={(params) => <TextField {...params} label="Tipos de Activos" />}
          />
          <LocalizationProvider dateAdapter={AdapterDayjs}>
            <DatePicker
              label="Fecha de Inicio"
              name="FechaInicio"
              value={dayjs(formulario.FechaInicio)}
              onChange={handleDateChange} // Use the updated event handler
            />
          </LocalizationProvider>
          <Box paddingBottom={2}>
            <TextField label="Nombre" name="Nombre" fullWidth value={formulario.Nombre} onChange={handleFormChange} />
          </Box>
          <Box paddingBottom={2}>
            <TextField label="Descripción" name="Descripción" fullWidth value={formulario.Descripción} onChange={handleFormChange} />
          </Box>
          <Box paddingBottom={2}>
            <TextField label="Observación" name="Observacion" fullWidth value={formulario.Observacion} onChange={handleFormChange} />
          </Box>
          <Box paddingBottom={2}>
            <TextField label="Valor" type="number" name="Valor" fullWidth value={formulario.Valor} onChange={handleFormChange} />
          </Box>
          {modificarIndex !== -1 ?
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DatePicker
                label="Fecha de Inactividad"
                name="FechaInactividad"
                value={dayjs(formulario.FechaInactividad)}
                onChange={handleFechaInactividadChange}
              // Use the updated event handler
              />
            </LocalizationProvider>
            : ' '}
          <Box>
            <Button variant="contained" color="primary" onClick={handleCancelar} sx={{ mr: 10 }}>
              Cancelar
            </Button>
            <Button variant="contained" color="primary" onClick={handleGuardar}>
              Guardar
            </Button>
          </Box>
        </Box>
      </Modal>
    </Box>
  );
};

export default TablaGA;

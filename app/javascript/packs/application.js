import "bootstrap";
import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

flatpickr(".datepicker", {

});


initMapbox();

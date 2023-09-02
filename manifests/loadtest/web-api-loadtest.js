import http from 'k6/http';
import { check } from 'k6';

export const options = {
  stages: [
    { target: 200, duration: '300s' },
    { target: 0, duration: '300s' },
  ],
};

export default function () {
  const result = http.get('http://web-api.test:8080/');
  check(result, {
    'http response status code is 200': result.status === 200,
  });
}

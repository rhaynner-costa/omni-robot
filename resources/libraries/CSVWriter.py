import csv
import os


class CSVWriter:
    def write_resultados_ciclo(self, resultados, ciclo_id, output_dir='results'):
        os.makedirs(output_dir, exist_ok=True)
        caminho = os.path.join(output_dir, f'resultados_ciclo_{ciclo_id}.csv')
        with open(caminho, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=['IdCenário', 'cpfCnpj', 'NumeroAtendimento'])
            writer.writeheader()
            for resultado in resultados:
                writer.writerow(resultado)
        return caminho

    def read_resultados_ciclo(self, ciclo_id, output_dir='results'):
        caminho = os.path.join(output_dir, f'resultados_ciclo_{ciclo_id}.csv')
        with open(caminho, newline='', encoding='utf-8') as f:
            return list(csv.DictReader(f))

    def write_resultados_com_retaguarda(self, resultados, ciclo_id, output_dir='results'):
        caminho = os.path.join(output_dir, f'resultados_ciclo_{ciclo_id}.csv')
        with open(caminho, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=['IdCenário', 'cpfCnpj', 'NumeroAtendimento', 'id_retaguarda'])
            writer.writeheader()
            for resultado in resultados:
                writer.writerow(resultado)
        return caminho

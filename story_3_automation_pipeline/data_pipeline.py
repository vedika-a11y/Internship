import pandas as pd
import numpy as np
import argparse
import logging
import os
from sqlalchemy import create_engine


def setup_logging():
    os.makedirs("output", exist_ok=True)

    logging.basicConfig(
        filename="output/pipeline.log",
        level=logging.INFO,
        format="%(asctime)s - %(levelname)s - %(message)s"
    )
    
    def load_data(C:\Users\Vedika Pingat\Intern-Projects\story 3\data):
    try:
        logging.info(f"Loading dataset from {C:\Users\Vedika Pingat\Intern-Projects\story 3\data}")
        df = pd.read_csv(C:\Users\Vedika Pingat\Intern-Projects\story 3\data)
        logging.info("Dataset loaded successfully")
        return df
    except FileNotFoundError:
        logging.error(f"File not found: {C:\Users\Vedika Pingat\Intern-Projects\story 3\data}")
        raise
    except Exception as e:
        logging.error(f"Error while loading data: {e}")
        raise
    
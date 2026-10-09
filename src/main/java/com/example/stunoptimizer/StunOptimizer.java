package com.example.stunoptimizer;

import net.fabricmc.api.ModInitializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StunOptimizer implements ModInitializer {
    public static final String MOD_ID = "stunoptimizer";
    public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

    @Override
    public void onInitialize() {
        LOGGER.info("StunOptimizer initialized for Minecraft 1.21.11");
    }
}

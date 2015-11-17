function E = nu2E(nu, ecc)
E = 2 * atan(sqrt((1 - ecc) / (1 + ecc)) * tan(nu / 2));
end

